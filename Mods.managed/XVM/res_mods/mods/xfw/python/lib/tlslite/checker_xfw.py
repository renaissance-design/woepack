from .checker import Checker
from .x509 import X509
from .x509certchain import X509CertChain
from .errors import *

class CheckerXfw(Checker):
    def __call__(self, connection):
        if not self.checkResumedSession and connection.resumed:
            return

        if self.x509Fingerprint:
            if connection._client:
                chain = connection.session.serverCertChain
            else:
                chain = connection.session.clientCertChain

            if self.x509Fingerprint:
                if isinstance(chain, X509CertChain):
                    if self.x509Fingerprint:
                        ### <xfw>
                        if isinstance(self.x509Fingerprint, basestring):
                            not_matched = chain.getFingerprint() != self.x509Fingerprint
                        else:
                            not_matched = chain.getFingerprint() not in self.x509Fingerprint
                        if not_matched:
                        ### </xfw>
                        #if chain.getFingerprint() != self.x509Fingerprint:
                            raise TLSFingerprintError(\
                                "X.509 fingerprint mismatch: %s, %s" % \
                                (chain.getFingerprint(), self.x509Fingerprint))
                elif chain:
                    raise TLSAuthenticationTypeError()
                else:
                    raise TLSNoAuthenticationError()