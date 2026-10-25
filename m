Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16E6606A339
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uyM3WhOU;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Cz0g25L3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8hN2cZTgnvFkDuNXP+F2k1Zb4BTdG7D/eMv9THWEqAc=; b=uyM3WhOU0geznSP2Q7IjnGsied
	yVTjnWpxF5NTiImkPqnaM36uw2MrQMyg5MVprclzgUlBl9fGefUX86A0T0/SA8tjbnU2ZJ+rSOaDT
	VrqLkLtvD0B4JzvWRQoLKzVFx/pniimo3sMLC6htfOMyKZPHaI/DR7CJnPsIMEg3sQbAp+q3m4HlG
	zDxcAF9UEDxKiYj5V9lke09hxRPlulIJwjFHyh/OPytxAeDCwhEUK/SHiWZpfWW/Kqz5XjEXIgDAX
	iqsM8UpgutUedIxZhn3CYCUGMJHdpaGtM45qfd6trLzWgBGHvWmYpWqoD0APyJBQPGGshQdgofQ4J
	sd2y3RXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pL-00000001McI-3WxQ;
	Sun, 25 Oct 2026 19:24:19 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pI-00000001MaW-3SoA;
	Sun, 25 Oct 2026 19:24:18 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5IZ518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5IZ518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956249;
	bh=NIeDseMKJyVvL1fXcLlTOdRUV/IjUHUNJ1TexeATk08=;
	h=From:To:Cc:Subject:Date;
	b=Cz0g25L3Bzc7vojTcEyY2ynxGoIbDGhVVyEJwDU00nuhDHd2a0lm5kRQ8zeWqcj1/
	 9HB5zzC0Aa1QGvcPELskx3gsDN+qRhe0pfARUdwClVWyD/av5sfZ+PQc6GdIGWjfTL
	 99keGbUuvEZO4m5SS3UX1OjabmrDHUgMBwbJVKDI=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 0/7] Add support for S4 audio
Date: Sun, 25 Oct 2026 20:23:57 +0100
Message-ID: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122417_192922_60966F13 
X-CRM114-Status: GOOD (  11.15  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+
CgpUaGlzIHBpY2tzIHVwIEppZWJpbmcgQ2hlbidzICJbUEFUQ0ggdjYgMC80XSBBZGQgc3VwcG9y
dCBmb3IgUzQgYXVkaW8iCihhbmQgdGhlIHRvaGRtaXR4IFM0IHBhdGNoKSB1bmNoYW5nZWQgYXBh
cnQgZnJvbSByZWJhc2luZywgd2l0aApKaWViaW5nJ3MgYXV0aG9yc2hpcCBrZXB0LCBhbmQgYWRk
cyBvbmUgZml4IG9uIHRvcDoKCiA2OiBnMTJhLXRvYWNvZGVjOiBmaXggdGhlIFM0IHNvdXJjZSBt
dXggcmVhZC1iYWNrLiBUaGUgUzQgREFUX1NFTAogICAgZmllbGQgbW92ZWQsIHNvIHRoZSBtdXgg
YWx3YXlzIHJlYWQgYmFjayBhcyBpbnB1dCBBIGFuZCBEQVBNIG5ldmVyCiAgICBwb3dlcmVkIHRo
ZSBzZWxlY3RlZCBwYXRoLgoKW2Nrb2V2ZXI6IEppZWJpbmcsIGlmIHlvdSBoYXZlIGEgbmV3ZXIg
dmVyc2lvbiBvciBwcmVmZXIgdG8gcG9zdCB0aGlzCnlvdXJzZWxmLCBJIGFtIGhhcHB5IHRvIHJl
YmFzZSB0aGUgZml4IG9udG8gdGhhdCBpbnN0ZWFkLl0KClRlc3RlZDogSERNSSBhdWRpbyB1cCB0
byAxOTIga0h6OyB0aGUgVERNLUMgdG8gaW50ZXJuYWwgY29kZWMgcGF0aApwbGF5cyB3aXRob3V0
IGVycm9ycyBhdCA0NC4xIHRvIDE5MiBrSHogKG5vdCBsaXN0ZW5lZCB0bykuCgpUb29sIHVzZSAo
RG9jdW1lbnRhdGlvbi9wcm9jZXNzL2dlbmVyYXRlZC1jb250ZW50LnJzdCk6ClRoaXMgd29yayB3
YXMgZG9uZSB3aXRoIHRoZSBoZWxwIG9mIGFuIEFJIGNvZGluZyBhc3Npc3RhbnQsIENsYXVkZQoo
QW50aHJvcGljKSwgdXNlZCB0aHJvdWdoIENsYXVkZSBDb2RlIG92ZXIgbWFueSBzZXNzaW9ucy4g
SXQgZGlkIGEgbGFyZ2UKcGFydCBvZiB0aGUgaGFuZHMtb24gd29yazogaXQgcmVhZCB0aGUgdmVu
ZG9yIGtlcm5lbCBhbmQgdGhlIGZpcm13YXJlCmludGVyZmFjZXMsIHByb2JlZCByZWdpc3RlcnMg
b24gdGhlIGJvYXJkLCBkcmFmdGVkIHRoZSBjb2RlIGFuZCB0aGUKY2hhbmdlbG9ncywgYW5kIHJh
biB0aGUgYnVpbGRzLCBjaGVja3BhdGNoLCBkdF9iaW5kaW5nX2NoZWNrIGFuZCB0aGUKdGVzdHMg
b24gdGhlIGhhcmR3YXJlLiBJIGRpcmVjdGVkIHRoZSB3b3JrLCByZXZpZXdlZCBldmVyeSBjaGFu
Z2UgYW5kCnRoZSBmaW5hbCBwYXRjaGVzLCBhbmQgdGFrZSByZXNwb25zaWJpbGl0eSBmb3IgdGhl
bS4gVGhlcmUgaXMgbm8gc2luZ2xlCnByb21wdCB0byBxdW90ZTsgdGhlIHNlc3Npb25zIHdlcmUg
b2YgdGhlIGZvcm0gImZpbmQgb3V0IHdoeSBYIGZhaWxzIG9uCnRoaXMgYm9hcmQsIGZpeCBpdCwg
dGVzdCBpdCBvbiB0aGUgYm94Ii4KClRlc3RlZCBvbiBhbiBBbWVkaWF0ZWNoIFg5OFEgVFYgYm94
IChBbWxvZ2ljIFM5MDVXMiwgUzQgZmFtaWx5LCAyIEdpQiksCnZlbmRvciBVLUJvb3QgYW5kIEJM
MzEvT1AtVEVFLCBMaW51eCA3LjMgcGx1cyB0aGlzIHdvcmsuCgpDaHJpc3RpYW4gU3RlZmFuIEvD
tnbDqXItRHJheGwgKDEpOgogIEFTb0M6IG1lc29uOiBnMTJhLXRvYWNvZGVjOiBmaXggdGhlIFM0
IHNvdXJjZSBtdXggcmVhZC1iYWNrCgpKaWViaW5nIENoZW4gKDYpOgogIGR0LWJpbmRpbmdzOiBj
bG9jazogbWVzb246IEFkZCBhdWRpbyBwb3dlciBkb21haW4gZm9yIFM0IHNvYwogIGR0LWJpbmRp
bmdzOiBBc29jOiBheGctYXVkaW86IEFkZCBTNCBhdWRpbyB0b2NvZGVjCiAgQVNvQzogbWVzb246
IGcxMmEtdG9hY29kZWM6IEFkZCBTNCB0b2NvZGVjIGRyaXZlcgogIGNsazogbWVzb246IGF4Z19h
dWRpbzogYWRkIFM0IHN1cHBvcnQKICBBU29DOiBkdC1iaW5kaW5nczogYW1sb2dpYyxnMTJhLXRv
aGRtaXR4OiBhZGQgUzQgY29tcGF0aWJsZQogIEFTb0M6IG1lc29uOiBnMTJhLXRvaGRtaXR4OiBh
ZGQgUzQgc3VwcG9ydAoKIC4uLi9jbG9jay9hbWxvZ2ljLGF4Zy1hdWRpby1jbGtjLnlhbWwgICAg
ICAgICB8ICAxOCArLQogLi4uL2JpbmRpbmdzL3NvdW5kL2FtbG9naWMsZzEyYS10b2Fjb2RlYy55
YW1sIHwgICAxICsKIC4uLi9iaW5kaW5ncy9zb3VuZC9hbWxvZ2ljLGcxMmEtdG9oZG1pdHgueWFt
bCB8ICAgMSArCiBkcml2ZXJzL2Nsay9tZXNvbi9heGctYXVkaW8uYyAgICAgICAgICAgICAgICAg
fCAxNjUgKysrKysrKysrKysrKysrKysrCiBzb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5j
ICAgICAgICAgICAgICAgfCAgNTEgKysrKysrCiBzb3VuZC9zb2MvbWVzb24vZzEyYS10b2hkbWl0
eC5jICAgICAgICAgICAgICAgfCAgODAgKysrKysrKystCiA2IGZpbGVzIGNoYW5nZWQsIDMxMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA3YmU0YmM1MmZkOWUw
ZTU1ZGM5YTJlMDIzMmI4OTQyN2QyYzRiNjE0Ci0tIAoyLjU2LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
