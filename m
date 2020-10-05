Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8BEC4727D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:37:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C672168B
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHYaxcJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C672168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rgYUIpryEi1hEwn59+/bsu1D/tiK7dYdQT9VQtUL22c=; b=qHYaxcJ3LHL0QGM9XsXoHYvTu
	x3WkKF1KiUd3DqEvxf5MDRriH5bVh/xBHDyCPD1JlZLCTzXoCuVb2AzQet58HaE+rhVAGHfE9G880
	tKpIkBeiMQxzLfFVfByihokWHDTn5j5F88Zzyw5LOAYVoj6bIAj57R3J3zfnHLkPKNzMul+rEmrAt
	QxYLSsGW2zaFEuUyy84BiW4Vom7C6Egk/J7ZeV5s0P6AJcqZFcAZIz7E4Av0d/MaP58Gvu01khMiV
	GHgj8bxvzzlkyUFfYz+OnduB49D/hGXT2/VOriWoG8rNXIPsFFfnprUDMWXgXMkrVIYII7Et1tBHJ
	Np9SSEnlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXEj-0007Cf-6n; Mon, 05 Oct 2020 20:37:33 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDV-0006XA-Co; Mon, 05 Oct 2020 20:36:19 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mf0uq-1krT710Xnu-00gc2C; Mon, 05 Oct 2020 22:35:49 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD0-0004Vs-2D; Mon, 05 Oct 2020 22:35:47 +0200
Received: (nullmailer pid 10299 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:35 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 01/12] leds: pwm: Remove platform_data support
Date: Mon,  5 Oct 2020 22:34:40 +0200
Message-Id: <20201005203451.9985-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 60b617cbd4bf9c2e08b69b262f748e48
X-Provags-ID: V03:K1:F6CgTqFAM3Qqi3ZE0tnTBE4mNujqwFryfVD6rzRWENkVcmWDhRr
 ou4O8IwayvYCgYv1NB2QHjUyKASNO7CpeAclu6bjzPbL58Yz1gjVaTbdDBLPyxkddbNmtuS
 u/zezbz5ZKHIwKkOlUPALYQ/zqHv8QRZ0g1AFFM4I9nHeiA/U1S+TTqF/YMxJ9jyNM1FNbS
 lbO7btq+DmlmbcWrsSohA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dEdS/I+Xl2I=:PiLtBsHPvNdnKu/d/mxmsJ
 rEdBMUdvRuwWDDKxyaDMAHPYxYM88Oedh0ZKhZCTBisht7o/bSAwwCmh5yLjH++jYj4GKdY7h
 iKf9faeQjYQ8Ul4FLjZDsbZIstFJNoq8pwE7EckpgkTRHOVrrokkfm5tODmAzdlLvH34+xPJh
 mXYvgsGtDDL2pCp03/03mON0DCWPhB8XG0B2w+LcGABS23CL035nuH2fHjD/Xe4YfBvLBaaGV
 OsUZlv6HNVFtuUgrjhxmj4iwkoPovo/J3QCJ3651JqQUcbDtx6V1urdeVT7QyFvQ0IZsF+z54
 /zUMHwh75CMpvTC9OWDjTLDWGYoXwCg6i4tsD4YZ6yTIRXSea9xId5KCg6Gs06SXX63UrrTbO
 AZpMIvSUeqlk3KM1a9fxNa9vr2cV9HKYu/G584ctHMX803O3BHZL5qe7267p8pKo2HTpfnOpv
 AvSbJMMgZ9LWEiTRg6XCaBS5pvXx6EwASb20FVKHtAX1sNf9dko+psaZplMFMh2r25Nn1LAQx
 CuWxdse3MucWTkS3+d4Uws/qJ7L2thzCqLDJ/EjVWtA3LuLBLhXxAoTE2B7L3Vx929KdAv7AJ
 lDtKP1Um9mgL0Jehee0bzE3MedQbE4oRQ3Fgg3bgbIyxVnvgm21DKOcXWFmkqqGTwsrvJuc1r
 ZfGlonYTZeJIeu3YQqUy4gapBGXY0N24kLYZmeD/ygjyKgSyusCoz8l/Ymf3n85CCdzO0N4Ga
 B3dHGs6BYAKGvKUYWYRaGPLF+l9pHvmSMgRx1RKA8i0KLNenqDT+W+t9hlBIW86kFKkRDIcKp
 7r7xrzNZi6L+vlKt/FWCmHM/PrxbfGJw1EMyW0qrs8fB7ujLAO/XY0VmcS9HjeU1LiAtIqw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163617_672178_592E417F 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Denis Osterland-Heim <denis.osterland@diehl.com>,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
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
cmVrLmJlaHVuQG5pYy5jej4KLS0tCgpOb3RlczoKICAgIHY2IC0+IHY3OgogICAgICAqIChubyBj
aGFuZ2VzIG9uIHRoaXMgcGF0Y2gpCiAgICAKICAgIHY1IC0+IHY2OgogICAgICAqIGFkZGVkIFJl
dmlld2VkLWJ5IGZyb20gTWFyZWsKICAgICAgKiBtaW5pbWFsIGNvbW1pdCBtZXNzYWdlIHJld29y
ZGluZywgYmVjYXVzZSBhIGxhdGVyIHBhdGNoIHdhcwogICAgICAgIGFscmVhZHkgYXBwbGllZAog
ICAgCiAgICB2NToKICAgICAgKiBhZGRlZCB0aGlzIHBhdGNoIHRvIHNlcmllcyAocmVwbGFjaW5n
IGFub3RoZXIgcGF0Y2ggd2l0aCBhIG5vdAogICAgICAgIHdvcmtpbmcsIGRpZmZlcmVudCBhcHBy
b2FjaCkKCiBkcml2ZXJzL2xlZHMvbGVkcy1wd20uYyB8IDMwICsrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMgYi9kcml2ZXJzL2xlZHMv
bGVkcy1wd20uYwppbmRleCAyYTE2YWUwYmYwMjIuLmY1M2Y5MzA5Y2E2YyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMKKysrIGIvZHJpdmVycy9sZWRzL2xlZHMtcHdtLmMKQEAg
LTI0LDExICsyNCw2IEBAIHN0cnVjdCBsZWRfcHdtIHsKIAl1bnNpZ25lZCBpbnQJbWF4X2JyaWdo
dG5lc3M7CiB9OwogCi1zdHJ1Y3QgbGVkX3B3bV9wbGF0Zm9ybV9kYXRhIHsKLQlpbnQJCW51bV9s
ZWRzOwotCXN0cnVjdCBsZWRfcHdtCSpsZWRzOwotfTsKLQogc3RydWN0IGxlZF9wd21fZGF0YSB7
CiAJc3RydWN0IGxlZF9jbGFzc2RldgljZGV2OwogCXN0cnVjdCBwd21fZGV2aWNlCSpwd207CkBA
IC02MCw2ICs1NSw3IEBAIHN0YXRpYyBpbnQgbGVkX3B3bV9zZXQoc3RydWN0IGxlZF9jbGFzc2Rl
diAqbGVkX2NkZXYsCiAJcmV0dXJuIHB3bV9hcHBseV9zdGF0ZShsZWRfZGF0LT5wd20sICZsZWRf
ZGF0LT5wd21zdGF0ZSk7CiB9CiAKK19fYXR0cmlidXRlX18oKG5vbm51bGwpKQogc3RhdGljIGlu
dCBsZWRfcHdtX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBsZWRfcHdtX3ByaXYgKnBy
aXYsCiAJCSAgICAgICBzdHJ1Y3QgbGVkX3B3bSAqbGVkLCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAq
Zndub2RlKQogewpAQCAtNzMsMTAgKzY5LDcgQEAgc3RhdGljIGludCBsZWRfcHdtX2FkZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBsZWRfcHdtX3ByaXYgKnByaXYsCiAJbGVkX2RhdGEtPmNk
ZXYubWF4X2JyaWdodG5lc3MgPSBsZWQtPm1heF9icmlnaHRuZXNzOwogCWxlZF9kYXRhLT5jZGV2
LmZsYWdzID0gTEVEX0NPUkVfU1VTUEVORFJFU1VNRTsKIAotCWlmIChmd25vZGUpCi0JCWxlZF9k
YXRhLT5wd20gPSBkZXZtX2Z3bm9kZV9wd21fZ2V0KGRldiwgZndub2RlLCBOVUxMKTsKLQllbHNl
Ci0JCWxlZF9kYXRhLT5wd20gPSBkZXZtX3B3bV9nZXQoZGV2LCBsZWQtPm5hbWUpOworCWxlZF9k
YXRhLT5wd20gPSBkZXZtX2Z3bm9kZV9wd21fZ2V0KGRldiwgZndub2RlLCBOVUxMKTsKIAlpZiAo
SVNfRVJSKGxlZF9kYXRhLT5wd20pKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9F
UlIobGVkX2RhdGEtPnB3bSksCiAJCQkJICAgICAidW5hYmxlIHRvIHJlcXVlc3QgUFdNIGZvciAl
c1xuIiwKQEAgLTEzOSwxNSArMTMyLDExIEBAIHN0YXRpYyBpbnQgbGVkX3B3bV9jcmVhdGVfZndu
b2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGxlZF9wd21fcHJpdiAqcHJpdikKIAogc3Rh
dGljIGludCBsZWRfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7Ci0J
c3RydWN0IGxlZF9wd21fcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKCZw
ZGV2LT5kZXYpOwogCXN0cnVjdCBsZWRfcHdtX3ByaXYgKnByaXY7Ci0JaW50IGNvdW50LCBpOwog
CWludCByZXQgPSAwOworCWludCBjb3VudDsKIAotCWlmIChwZGF0YSkKLQkJY291bnQgPSBwZGF0
YS0+bnVtX2xlZHM7Ci0JZWxzZQotCQljb3VudCA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3Vu
dCgmcGRldi0+ZGV2KTsKKwljb3VudCA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3VudCgmcGRl
di0+ZGV2KTsKIAogCWlmICghY291bnQpCiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMTU3LDE2ICsx
NDYsNyBAQCBzdGF0aWMgaW50IGxlZF9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlpZiAoIXByaXYpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JaWYgKHBkYXRhKSB7Ci0J
CWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Ci0JCQlyZXQgPSBsZWRfcHdtX2FkZCgmcGRl
di0+ZGV2LCBwcml2LCAmcGRhdGEtPmxlZHNbaV0sCi0JCQkJCSAgTlVMTCk7Ci0JCQlpZiAocmV0
KQotCQkJCWJyZWFrOwotCQl9Ci0JfSBlbHNlIHsKLQkJcmV0ID0gbGVkX3B3bV9jcmVhdGVfZndu
b2RlKCZwZGV2LT5kZXYsIHByaXYpOwotCX0KKwlyZXQgPSBsZWRfcHdtX2NyZWF0ZV9md25vZGUo
JnBkZXYtPmRldiwgcHJpdik7CiAKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
