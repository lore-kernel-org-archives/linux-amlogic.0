Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AAC606D80E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wffkg6ns;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=lEdvJLsu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nFMciHralQ1i4lmLf7iGMEtQQ0ERmC2cGfACPZWZwCk=; b=Wffkg6nshuxWyptvO56uwx+4xr
	MSCw+hpzoIpgQHCyR2kbwh+Qhf6gb/g2K+L/Hd6jk5C9Dnmsav90z7TIcsA1I28IiHJAngKKMEEot
	QZvX0RdzDypWBUkWam8SyETPTIiq2+UHBX2jXcJvj4VCembc6n+8mDgdI5+WKJZLzj2x8ooc/3Bzr
	awsEIXXXe5oPVB8eQ3058kOox6pB+kkjUnzqGUAcLGbMt8fJRBHxfgDijPnnFAhRcT6JjcYrQnH5+
	D8uab/3l6YMGHOyD8042LVO0jOsWnFf9SznJyrT6uaqGdeFi04BxFEw4zrIbDZEx4frAdoyGwS0Fa
	ZeOqebTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHT7-0000000BzrG-2jA2;
	Fri, 06 Nov 2026 10:46:49 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHT4-0000000BzpC-2u0V;
	Fri, 06 Nov 2026 10:46:48 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AkYPC1953082
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:46:36 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AkYPC1953082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793961996;
	bh=vLIUtL4Xr1f0AzzVPwVtBtZX/qzPi+fLoa0ubdM8I/0=;
	h=From:To:Cc:Subject:Date;
	b=lEdvJLsuhqp1rYBqP/fHpIoWbBWw6vFYe1sKWY/sz09eVlro/MRtqV4ww1f0OWI01
	 9W2Y4EEE5siqjvN63cc664O2oxyubc9W9RC22AgENL6kYRzcWvmt76/Le2qtscJL63
	 vulL84EStzMnFE51xJLGxowN5AgBp4d6yw5gfvLQ=
From: christian.koever-draxl@student.uibk.ac.at
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
Date: Fri,  6 Nov 2026 11:46:32 +0100
Message-ID: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024647_069147_D581F599 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGUgUzQgVVNCIGdsdWUgaXMgdGhlIEcxMkEgb25lLCBidXQgaXQgZnJvbnRzIGFuIHhIQ0kg
aG9zdCBjb250cm9sbGVyCmluc3RlYWQgb2YgYSBEV0MzIGNvcmUsIHdpdGggdHdvIFVTQjIgUEhZ
cyBhbmQgbm8gVVNCMyBQSFkuIEFkZCBhbiBTNApjb21wYXRpYmxlIHdpdGggdGhlIEcxMkEgb25l
IGFzIGZhbGxiYWNrLCBhbmQgYWxsb3cgYSBnZW5lcmljIHhIQ0kKY2hpbGQgbm9kZS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZlckBvdXRsb29r
LmRlPgotLS0KVG9vbCB1c2UgKERvY3VtZW50YXRpb24vcHJvY2Vzcy9nZW5lcmF0ZWQtY29udGVu
dC5yc3QpOgpUaGlzIHdvcmsgd2FzIGRvbmUgd2l0aCB0aGUgaGVscCBvZiBhbiBBSSBjb2Rpbmcg
YXNzaXN0YW50LCBDbGF1ZGUKKEFudGhyb3BpYyksIHVzZWQgdGhyb3VnaCBDbGF1ZGUgQ29kZSBv
dmVyIG1hbnkgc2Vzc2lvbnMuIEl0IGRpZCBhIGxhcmdlCnBhcnQgb2YgdGhlIGhhbmRzLW9uIHdv
cms6IGl0IHJlYWQgdGhlIHZlbmRvciBrZXJuZWwgYW5kIHRoZSBmaXJtd2FyZQppbnRlcmZhY2Vz
LCBwcm9iZWQgcmVnaXN0ZXJzIG9uIHRoZSBib2FyZCwgZHJhZnRlZCB0aGUgY29kZSBhbmQgdGhl
CmNoYW5nZWxvZ3MsIGFuZCByYW4gdGhlIGJ1aWxkcywgY2hlY2twYXRjaCwgZHRfYmluZGluZ19j
aGVjayBhbmQgdGhlCnRlc3RzIG9uIHRoZSBoYXJkd2FyZS4gSSBkaXJlY3RlZCB0aGUgd29yaywg
cmV2aWV3ZWQgZXZlcnkgY2hhbmdlIGFuZAp0aGUgZmluYWwgcGF0Y2hlcywgYW5kIHRha2UgcmVz
cG9uc2liaWxpdHkgZm9yIHRoZW0uIFRoZXJlIGlzIG5vIHNpbmdsZQpwcm9tcHQgdG8gcXVvdGU7
IHRoZSBzZXNzaW9ucyB3ZXJlIG9mIHRoZSBmb3JtICJmaW5kIG91dCB3aHkgWCBmYWlscyBvbgp0
aGlzIGJvYXJkLCBmaXggaXQsIHRlc3QgaXQgb24gdGhlIGJveCIuCgpUZXN0ZWQgb24gYW4gQW1l
ZGlhdGVjaCBYOThRIFRWIGJveCAoQW1sb2dpYyBTOTA1VzIsIFM0IGZhbWlseSwgMiBHaUIpLAp2
ZW5kb3IgVS1Cb290IGFuZCBCTDMxL09QLVRFRSwgTGludXggNy4zIHBsdXMgdGhpcyB3b3JrLgoK
IC4uLi91c2IvYW1sb2dpYyxtZXNvbi1nMTJhLXVzYi1jdHJsLnlhbWwgICAgICB8IDI0ICsrKysr
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvYW1sb2dpYyxtZXNvbi1nMTJhLXVzYi1jdHJsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL2FtbG9naWMsbWVzb24tZzEyYS11c2ItY3RybC55YW1sCmluZGV4
IGRhNzU3YzExNTVkNC4uMTg2MzkwZjkzMGY4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL2FtbG9naWMsbWVzb24tZzEyYS11c2ItY3RybC55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvYW1sb2dpYyxtZXNvbi1n
MTJhLXVzYi1jdHJsLnlhbWwKQEAgLTI3LDE0ICsyNywyMSBAQCBkZXNjcmlwdGlvbjogfAogCiAg
IFRoZSBBbWxvZ2ljIEdYTCwgR1hNICYgQVhHIFNvQ3MgZG9lc24ndCBlbWJlZCBhbiBVU0IzIFBI
WS4KIAorICBUaGUgQW1sb2dpYyBTNCB1c2VzIHRoZSBHMTJBIGdsdWUgaW4gZnJvbnQgb2YgYW4g
eEhDSSBob3N0IGNvbnRyb2xsZXIKKyAgaW5zdGVhZCBvZiBhIERXQzMgY29yZSwgd2l0aCB0d28g
VVNCMiBQSFlzIGFuZCBubyBVU0IzIFBIWS4KKwogcHJvcGVydGllczoKICAgY29tcGF0aWJsZToK
LSAgICBlbnVtOgotICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4bC11c2ItY3RybAotICAgICAgLSBh
bWxvZ2ljLG1lc29uLWd4bS11c2ItY3RybAotICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy11c2It
Y3RybAotICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtdXNiLWN0cmwKLSAgICAgIC0gYW1sb2dp
YyxtZXNvbi1hMS11c2ItY3RybAorICAgIG9uZU9mOgorICAgICAgLSBlbnVtOgorICAgICAgICAg
IC0gYW1sb2dpYyxtZXNvbi1neGwtdXNiLWN0cmwKKyAgICAgICAgICAtIGFtbG9naWMsbWVzb24t
Z3htLXVzYi1jdHJsCisgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy11c2ItY3RybAorICAg
ICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLXVzYi1jdHJsCisgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uLWExLXVzYi1jdHJsCisgICAgICAtIGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6IGFt
bG9naWMsbWVzb24tczQtdXNiLWN0cmwKKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29u
LWcxMmEtdXNiLWN0cmwKIAogICByYW5nZXM6IHRydWUKIApAQCAtODIsNiArODksNyBAQCBwYXR0
ZXJuUHJvcGVydGllczoKICAgICBvbmVPZjoKICAgICAgIC0gJHJlZjogZHdjMi55YW1sIwogICAg
ICAgLSAkcmVmOiBzbnBzLGR3YzMueWFtbCMKKyAgICAgIC0gJHJlZjogZ2VuZXJpYy14aGNpLnlh
bWwjCiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQogCkBAIC0xMDIsOCArMTEwLDggQEAg
YWxsT2Y6CiAgIC0gaWY6CiAgICAgICBwcm9wZXJ0aWVzOgogICAgICAgICBjb21wYXRpYmxlOgot
ICAgICAgICAgIGVudW06Ci0gICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZzEyYS11c2ItY3Ry
bAorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IGFtbG9naWMsbWVzb24t
ZzEyYS11c2ItY3RybAogCiAgICAgdGhlbjoKICAgICAgIHByb3BlcnRpZXM6CgpiYXNlLWNvbW1p
dDogN2JlNGJjNTJmZDllMGU1NWRjOWEyZTAyMzJiODk0MjdkMmM0YjYxNAotLSAKMi41Ni4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
