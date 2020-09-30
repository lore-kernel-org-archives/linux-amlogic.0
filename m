Return-Path: <SRS0=xPAz=DH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617D0C4727F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:47:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1579620C09
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HzyqLjRP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1579620C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cBxIzbiWpbTLPq2rApny6JJ+IJCUYv3kE7ThpFz9cpw=; b=HzyqLjRPNJZ6XZceKUSLimZoX
	2qBewiC7QM2xOSnVBsTjmPv4rxCYDCnN4enoCk9zzAZuU9n/K7KQP3mh//9iaAmpGR2q5Y8c4nSaU
	QWvsRwcavDgkqkmt3q4cDM7If/Jaa8egr7z1fj/v+juikOnmQy7La9p1o0lhM8TW2xc4HZEQSLb7A
	CrFhG45UJmPCiN0EvvQvzIlyIKUrXcDcF2l6nZ5YtF61Tfsdlnm6A4wB60c/IZNO/Wt+KZ9tlYNVN
	7Xf9yN8aL6hlTc6mAnVTqPz6cemH2qBVkHmzxWqkvNZ9sXBownt3UOjC5FWw7et8KIM3OE9sZRdme
	tUII4U9kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNlp4-0000MS-Rj; Wed, 30 Sep 2020 23:47:46 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNlp2-0000Lr-Qr; Wed, 30 Sep 2020 23:47:45 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBDrM-1kGeY90zPi-00CgJ0; Thu, 01 Oct 2020 01:47:23 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlod-0007Z0-T1; Thu, 01 Oct 2020 01:47:21 +0200
Received: (nullmailer pid 7728 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:19 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Subject: [PATCH v6 1/7] leds: pwm: Remove platform_data support
Date: Thu,  1 Oct 2020 01:46:31 +0200
Message-Id: <20200930234637.7573-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 257374c4a781fc070d55e21f439eb91a
X-Provags-ID: V03:K1:jOBjAF/CkF48hBbOCUr5Z1QgpCLc02GeaEYNbCwJ99PA1LLbkiZ
 xHzp1rqs9sSPt1xHxyhq4jLizqlO9LFAw++h6YE0LN//pXOKbLHkKBiiiGwmFPlz7CdFDLg
 JNaqS1r+44GEpZCiXEfTEmJDd8Qp1ji40AAzKG+i3m1nCi1cNdsx/EgsVuJ4zuovoJNDa6y
 dgbxd+LBEval1wn5/02LQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GSF88Ru63gE=:fVUBUUaVYcOB8FBvPO/ppG
 wJ59KSFdKkPsDDQGJulkZ5RoXmTDDno1WSs/s35+AqRr9FKp6arQHplZDE21a7pYiwtgllW5f
 Iz4fjCCTRN5u17zN4sswYwd+eQqtN0wgC/GeJh3iLP/0u7qw9IliGjLSWXZEvbFjKpT4W71Yy
 y6DigH3OgpQzKihT4hSu5Rz2tBRCkajY8u0zKaU9Qm0kDCY8uL3qQ4qU49vq11zwA1uxz0be9
 0gA0tBAVQrEaH2Azi1eiQnDL29uTWE3NUyVa91wMRJuqeQfQnJEcGqUYRH99H+ID+iZx2UXSX
 135mff55LNYdB51u1Q8ewbc69X7R3jejwgV/oS2uVMU78KzrzBTPIDiP2/CYmBmNq2ROPQN+X
 rlPaV8YVwJlkzpzfhycj/dy/sJKJONYJuqi80chS0VIIOpvElOpa9C4g99xISgXTnT+g++y8o
 5MVXRv3HFv3re8X4xU87/qXhDSz4cI5Xd4cXj0LkejP52cP0NQEAdDpu7n27WbzFRAicuHyJQ
 JGGQJMnjBQjuYqBEdAIpw0g7UvhNi6+AYteUj6D+eI7eMe4mO/iC/OwZhz/xBQFu5swmtmxp+
 37JYjxZeCRLfQXSso6sY76nyyu7+MaJR4QtOW/dzjgI61Rg8hjgO78AGQAVBKNbDqMDnegHGA
 v21NWOYBOO+ELiQ75QGMhBDYJyheeAhgj7KgZlT/crfVomMf/89fWO5ExILEQ40RXA3DUHoEJ
 +PvwlulIjGeMh4OkzpSFeh6K+sJNwiz7XSwpH2K5IQPxwzeStDqTJdSd2C4XvCI+ch4LzcVgK
 qmlUPtqBhjiIEV5MW9QoH1MskQUCHctAMNH81W+xNDO0usOJkcQwuIhlKPm5rs/NATCucwJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_194745_075913_20C35721 
X-CRM114-Status: GOOD (  19.82  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexander Dahl <ada@thorsis.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Denis Osterland-Heim <denis.osterland@diehl.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

U2luY2UgY29tbWl0IDE0MWYxNWM2NmQ5NCAoImxlZHM6IHB3bTogcmVtb3ZlIGhlYWRlciIpIHRo
YXQgcGxhdGZvcm0KaW50ZXJmYWNlIGlzIG5vdCB1c2FibGUgZnJvbSBvdXRzaWRlIGFuZCB0aGVy
ZSBzZWVtcyB0byBiZSBubyBpbiB0cmVlCnVzZXIgYW55bW9yZS4gIEFsbCBpbi10cmVlIHVzZXJz
IG9mIHRoZSBsZWRzLXB3bSBkcml2ZXIgc2VlbSB0byB1c2UgRFQKY3VycmVudGx5LiAgR2V0dGlu
ZyByaWQgb2YgdGhlIG9sZCBwbGF0Zm9ybSBpbnRlcmZhY2UgYWxsb3dzIHRoZQpsZWRzLXB3bSBk
cml2ZXIgdG8gc3dpdGNoIG92ZXIgZnJvbSAnZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXIoKScg
dG8KJ2Rldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyX2V4dCgpJy4KClNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBEYWhsIDxwb3N0QGxlc3BvY2t5LmRlPgpDYzogRGVuaXMgT3N0ZXJsYW5kLUhlaW0g
PGRlbmlzLm9zdGVybGFuZEBkaWVobC5jb20+ClJldmlld2VkLWJ5OiBNYXJlayBCZWjDum4gPG1h
cmVrLmJlaHVuQG5pYy5jej4KLS0tCgpOb3RlczoKICAgIHY1IC0+IHY2OgogICAgICAqIGFkZGVk
IFJldmlld2VkLWJ5IGZyb20gTWFyZWsKICAgICAgKiBtaW5pbWFsIGNvbW1pdCBtZXNzYWdlIHJl
d29yZGluZywgYmVjYXVzZSBhIGxhdGVyIHBhdGNoIHdhcwogICAgICAgIGFscmVhZHkgYXBwbGll
ZAogICAgCiAgICB2NToKICAgICAgKiBhZGRlZCB0aGlzIHBhdGNoIHRvIHNlcmllcyAocmVwbGFj
aW5nIGFub3RoZXIgcGF0Y2ggd2l0aCBhIG5vdAogICAgICAgIHdvcmtpbmcsIGRpZmZlcmVudCBh
cHByb2FjaCkKICAgIAogICAgdjU6CiAgICAgKiBhZGRlZCB0aGlzIHBhdGNoIHRvIHNlcmllcyAo
cmVwbGFjaW5nIGFub3RoZXIgcGF0Y2ggd2l0aCBhIG5vdAogICAgICAgd29ya2luZywgZGlmZmVy
ZW50IGFwcHJvYWNoKQoKIGRyaXZlcnMvbGVkcy9sZWRzLXB3bS5jIHwgMzAgKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYyBiL2RyaXZl
cnMvbGVkcy9sZWRzLXB3bS5jCmluZGV4IDJhMTZhZTBiZjAyMi4uZjUzZjkzMDljYTZjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYworKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1w
d20uYwpAQCAtMjQsMTEgKzI0LDYgQEAgc3RydWN0IGxlZF9wd20gewogCXVuc2lnbmVkIGludAlt
YXhfYnJpZ2h0bmVzczsKIH07CiAKLXN0cnVjdCBsZWRfcHdtX3BsYXRmb3JtX2RhdGEgewotCWlu
dAkJbnVtX2xlZHM7Ci0Jc3RydWN0IGxlZF9wd20JKmxlZHM7Ci19OwotCiBzdHJ1Y3QgbGVkX3B3
bV9kYXRhIHsKIAlzdHJ1Y3QgbGVkX2NsYXNzZGV2CWNkZXY7CiAJc3RydWN0IHB3bV9kZXZpY2UJ
KnB3bTsKQEAgLTYwLDYgKzU1LDcgQEAgc3RhdGljIGludCBsZWRfcHdtX3NldChzdHJ1Y3QgbGVk
X2NsYXNzZGV2ICpsZWRfY2RldiwKIAlyZXR1cm4gcHdtX2FwcGx5X3N0YXRlKGxlZF9kYXQtPnB3
bSwgJmxlZF9kYXQtPnB3bXN0YXRlKTsKIH0KIAorX19hdHRyaWJ1dGVfXygobm9ubnVsbCkpCiBz
dGF0aWMgaW50IGxlZF9wd21fYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGxlZF9wd21f
cHJpdiAqcHJpdiwKIAkJICAgICAgIHN0cnVjdCBsZWRfcHdtICpsZWQsIHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmd25vZGUpCiB7CkBAIC03MywxMCArNjksNyBAQCBzdGF0aWMgaW50IGxlZF9wd21f
YWRkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGxlZF9wd21fcHJpdiAqcHJpdiwKIAlsZWRf
ZGF0YS0+Y2Rldi5tYXhfYnJpZ2h0bmVzcyA9IGxlZC0+bWF4X2JyaWdodG5lc3M7CiAJbGVkX2Rh
dGEtPmNkZXYuZmxhZ3MgPSBMRURfQ09SRV9TVVNQRU5EUkVTVU1FOwogCi0JaWYgKGZ3bm9kZSkK
LQkJbGVkX2RhdGEtPnB3bSA9IGRldm1fZndub2RlX3B3bV9nZXQoZGV2LCBmd25vZGUsIE5VTEwp
OwotCWVsc2UKLQkJbGVkX2RhdGEtPnB3bSA9IGRldm1fcHdtX2dldChkZXYsIGxlZC0+bmFtZSk7
CisJbGVkX2RhdGEtPnB3bSA9IGRldm1fZndub2RlX3B3bV9nZXQoZGV2LCBmd25vZGUsIE5VTEwp
OwogCWlmIChJU19FUlIobGVkX2RhdGEtPnB3bSkpCiAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRl
diwgUFRSX0VSUihsZWRfZGF0YS0+cHdtKSwKIAkJCQkgICAgICJ1bmFibGUgdG8gcmVxdWVzdCBQ
V00gZm9yICVzXG4iLApAQCAtMTM5LDE1ICsxMzIsMTEgQEAgc3RhdGljIGludCBsZWRfcHdtX2Ny
ZWF0ZV9md25vZGUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbGVkX3B3bV9wcml2ICpwcml2
KQogCiBzdGF0aWMgaW50IGxlZF9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKLQlzdHJ1Y3QgbGVkX3B3bV9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRldl9nZXRfcGxh
dGRhdGEoJnBkZXYtPmRldik7CiAJc3RydWN0IGxlZF9wd21fcHJpdiAqcHJpdjsKLQlpbnQgY291
bnQsIGk7CiAJaW50IHJldCA9IDA7CisJaW50IGNvdW50OwogCi0JaWYgKHBkYXRhKQotCQljb3Vu
dCA9IHBkYXRhLT5udW1fbGVkczsKLQllbHNlCi0JCWNvdW50ID0gZGV2aWNlX2dldF9jaGlsZF9u
b2RlX2NvdW50KCZwZGV2LT5kZXYpOworCWNvdW50ID0gZGV2aWNlX2dldF9jaGlsZF9ub2RlX2Nv
dW50KCZwZGV2LT5kZXYpOwogCiAJaWYgKCFjb3VudCkKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0x
NTcsMTYgKzE0Niw3IEBAIHN0YXRpYyBpbnQgbGVkX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCWlmICghcHJpdikKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlpZiAocGRh
dGEpIHsKLQkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKLQkJCXJldCA9IGxlZF9wd21f
YWRkKCZwZGV2LT5kZXYsIHByaXYsICZwZGF0YS0+bGVkc1tpXSwKLQkJCQkJICBOVUxMKTsKLQkJ
CWlmIChyZXQpCi0JCQkJYnJlYWs7Ci0JCX0KLQl9IGVsc2UgewotCQlyZXQgPSBsZWRfcHdtX2Ny
ZWF0ZV9md25vZGUoJnBkZXYtPmRldiwgcHJpdik7Ci0JfQorCXJldCA9IGxlZF9wd21fY3JlYXRl
X2Z3bm9kZSgmcGRldi0+ZGV2LCBwcml2KTsKIAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
