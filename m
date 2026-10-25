Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FA8606A31A
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bmqao5bH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=R12NoYLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9MhKeTHUe7vQ3qgIDD5VUfH+71QHex5KYbKAbHSn4ag=; b=bmqao5bHPUVyamhplDcV9KaJ+z
	9fJ7WwGNCNVTYGdt77M88tbiL+BObiSDWzomsZQ8k1+n1dFRi063GkPthWhKj9w2TyC8OnsIaqTnl
	U9scVbBhUbntshw5mKwJF6lKemXfYUrbHk3UFcDrbL5dpsAP254AmSU/LqelDZyCKmQAwUAQL0Rt4
	d9x/A07WdOS0QeLhttCEiCD8XfGYyoKMIrHeFp71P637+4U79qCJ2Ujr7d/Hb9KF4cdDv91G2JRsj
	UqCIDHBd09zNjgzIp8WZvZMbJBvNUBTyIrpdwJ1bt0oRFHu/uAwWnoBy75zI2aq2xesRBMBj1yV8H
	CX2bEq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nh-00000001LMn-3gaV;
	Sun, 25 Oct 2026 19:22:37 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3na-00000001LDv-2gom;
	Sun, 25 Oct 2026 19:22:32 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMK10517096
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:23 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMK10517096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956144;
	bh=4Tvh3ER3yLmblvY3yXSbn1ihzEpc/dPSRG3EnZEQ720=;
	h=From:To:Cc:Subject:Date;
	b=R12NoYLl7dofrZhqAh7l5eB0oPYAZY2oo/Wn/yCUtxkk7LQaz1nieBJa0xdTF1Mgm
	 tSee/yLMwQWK2QXQXWRXrgbrO2neCy6/oZ5vTQ9DIt8IxvV1hNTnNyRejd7B1O/buW
	 Uazurn5UtuEy+Ucq/+XL0KH0wa/IQe+rLFDlgayY=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/4] arm64: amlogic: S4 CPU frequency scaling
Date: Sun, 25 Oct 2026 20:22:15 +0100
Message-ID: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122231_036953_62CDE0FD 
X-CRM114-Status: GOOD (  11.93  )
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
CgpTNCBrZWVwcyBpdHMgQ1BVIGNsb2NrIHJlZ2lzdGVycyBpbiB0aGUgc2VjdXJlIHdvcmxkIGFu
ZCBiaW5zIGl0cyBwYXJ0cwpieSB2b2x0YWdlLCBzbyBDUFUgRFZGUyBuZWVkcyB0aHJlZSBwaWVj
ZXM6CgogMS0yOiB0aGUgQ1BVIGNsb2NrIGluIHRoZSBTNCBQTEwgY29udHJvbGxlciwgZHJpdmVu
IHRocm91Z2ggdGhlIHR3bwogICAgICBCTDMxIFNNQyBzZXJ2aWNlcyB0aGUgZmlybXdhcmUgZXhw
b3NlcyAoc3lzX3BsbCBhbmQgdGhlIENQVSBjbG9jawogICAgICB0cmVlKSwgbW9kZWxsZWQgYXMg
b25lIGNsb2NrIGJlY2F1c2UgdGhlIGZpcm13YXJlIGNhbGxzIGRvIG5vdAogICAgICBtYXAgb250
byBzZXBhcmF0ZSBtdXhlcyBhbmQgZGl2aWRlcnM7CiAzOiAgIHRoZSBzZWN1cmUgbW9uaXRvciBj
YWxsIHRoYXQgcmV0dXJucyB0aGUgQ1BVIHNwZWVkIGJpbjsKIDQ6ICAgYSBzbWFsbCBjcHVmcmVx
IGRyaXZlciB0aGF0IHBpY2tzIHRoZSAib3BwLW1pY3Jvdm9sdC1zcGVlZDxiaW4+IgogICAgICBj
dXJ2ZSBhbmQgcmVnaXN0ZXJzIGNwdWZyZXEtZHQsIGxpa2Ugc3VuNTBpLWNwdWZyZXEtbnZtZW0u
CgpUaGlzIGFwcGxpZXMgb24gdG9wIG9mICJmaXJtd2FyZTogbWVzb246IHNtOiBtYWtlIHBvd2Vy
LW9mZiB3b3JrIG9uClM0IiAoc2VudCBzZXBhcmF0ZWx5OyB0aGUgY29tbWFuZCB0YWJsZXMgb3Zl
cmxhcCkuIFRoZSBwYXRjaGVzIHRvdWNoCmNsaywgZmlybXdhcmUvbWVzb24gYW5kIGNwdWZyZXEu
IFBhdGNoIDQgZGVwZW5kcyBvbiBwYXRjaCAzOyAxLTIgYXJlCmluZGVwZW5kZW50IG9mIDMtNC4g
SSBhbSBoYXBweSB0byBzcGxpdCB0aGVtIGlmIHRoZSBtYWludGFpbmVycyBwcmVmZXIKdG8gdGFr
ZSB0aGVtIHRocm91Z2ggdGhlaXIgdHJlZXMgc2VwYXJhdGVseS4KClRlc3RlZCBvbiBhbiBTOTA1
VzIgKHNwZWVkIGJpbiAyKTogMTAwIE1IeiB0byAxLjkwOCBHSHogd2l0aCB0aGUKdmVuZG9yIHZv
bHRhZ2VzLCB0cmFuc2l0aW9ucyB1bmRlciBsb2FkIGZvciBob3VycywgdmRkY3B1IGZvbGxvd3Mg
dGhlCnRhYmxlLgoKVG9vbCB1c2UgKERvY3VtZW50YXRpb24vcHJvY2Vzcy9nZW5lcmF0ZWQtY29u
dGVudC5yc3QpOgpUaGlzIHdvcmsgd2FzIGRvbmUgd2l0aCB0aGUgaGVscCBvZiBhbiBBSSBjb2Rp
bmcgYXNzaXN0YW50LCBDbGF1ZGUKKEFudGhyb3BpYyksIHVzZWQgdGhyb3VnaCBDbGF1ZGUgQ29k
ZSBvdmVyIG1hbnkgc2Vzc2lvbnMuIEl0IGRpZCBhIGxhcmdlCnBhcnQgb2YgdGhlIGhhbmRzLW9u
IHdvcms6IGl0IHJlYWQgdGhlIHZlbmRvciBrZXJuZWwgYW5kIHRoZSBmaXJtd2FyZQppbnRlcmZh
Y2VzLCBwcm9iZWQgcmVnaXN0ZXJzIG9uIHRoZSBib2FyZCwgZHJhZnRlZCB0aGUgY29kZSBhbmQg
dGhlCmNoYW5nZWxvZ3MsIGFuZCByYW4gdGhlIGJ1aWxkcywgY2hlY2twYXRjaCwgZHRfYmluZGlu
Z19jaGVjayBhbmQgdGhlCnRlc3RzIG9uIHRoZSBoYXJkd2FyZS4gSSBkaXJlY3RlZCB0aGUgd29y
aywgcmV2aWV3ZWQgZXZlcnkgY2hhbmdlIGFuZAp0aGUgZmluYWwgcGF0Y2hlcywgYW5kIHRha2Ug
cmVzcG9uc2liaWxpdHkgZm9yIHRoZW0uIFRoZXJlIGlzIG5vIHNpbmdsZQpwcm9tcHQgdG8gcXVv
dGU7IHRoZSBzZXNzaW9ucyB3ZXJlIG9mIHRoZSBmb3JtICJmaW5kIG91dCB3aHkgWCBmYWlscyBv
bgp0aGlzIGJvYXJkLCBmaXggaXQsIHRlc3QgaXQgb24gdGhlIGJveCIuCgpUZXN0ZWQgb24gYW4g
QW1lZGlhdGVjaCBYOThRIFRWIGJveCAoQW1sb2dpYyBTOTA1VzIsIFM0IGZhbWlseSwgMiBHaUIp
LAp2ZW5kb3IgVS1Cb290IGFuZCBCTDMxL09QLVRFRSwgTGludXggNy4zIHBsdXMgdGhpcyB3b3Jr
LgoKQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsICg0KToKICBkdC1iaW5kaW5nczogY2xv
Y2s6IGFtbG9naWMsczQtcGxsLWNsa2M6IGFkZCB0aGUgQ1BVIGNsb2NrCiAgY2xrOiBtZXNvbjog
czQtcGxsOiBhZGQgdGhlIENQVSBjbG9jawogIGZpcm13YXJlOiBtZXNvbjogc206IGFkZCB0aGUg
Q1BVIHNwZWVkIGJpbiBjYWxsCiAgY3B1ZnJlcTogYWRkIGFuIEFtbG9naWMgc3BlZWQtYmluIGRy
aXZlcgoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCiBkcml2ZXJzL2Nsay9tZXNvbi9zNC1wbGwuYyAgICAgICAgICAgICAgICAgICAgfCAzMjAg
KysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2NwdWZyZXEvS2NvbmZpZy5hcm0gICAgICAgICAg
ICAgICAgICAgfCAgMTQgKwogZHJpdmVycy9jcHVmcmVxL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvY3B1ZnJlcS9hbWxvZ2ljLWNwdWZyZXEuYyAgICAgICAg
ICAgICB8IDE4NCArKysrKysrKysrCiBkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS1kdC1wbGF0ZGV2
LmMgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jICAg
ICAgICAgICAgIHwgICAxICsKIC4uLi9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1j
bGtjLmggICB8ICAgMSArCiBpbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgg
ICAgICAgfCAgIDEgKwogOSBmaWxlcyBjaGFuZ2VkLCA1MjUgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvY3B1ZnJlcS9hbWxvZ2ljLWNwdWZyZXEuYwoKCmJhc2UtY29t
bWl0OiA3YmU0YmM1MmZkOWUwZTU1ZGM5YTJlMDIzMmI4OTQyN2QyYzRiNjE0CnByZXJlcXVpc2l0
ZS1wYXRjaC1pZDogZjk3NzExN2NmN2YzYTYxM2Y2NjdjMjEwNmU3ZjRhYWZjMGFjZTExNgpwcmVy
ZXF1aXNpdGUtcGF0Y2gtaWQ6IDFlYzRlMWJiNDU2YmQxM2NlYzRmMTQwMjE5ZjcwMGY0NGVhMTk2
MDYKLS0gCjIuNTYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
