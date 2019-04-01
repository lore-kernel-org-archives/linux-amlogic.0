Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7577AC4360F
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 17:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D19920880
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 17:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uFFoE86h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pCxXWN9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D19920880
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jf+Eaxd75IdLAkea9pwkQplMl5cjHwkXUTo5QLAOWpU=; b=uFFoE86hpkRzmB
	j7pfPj1zGuD3DukKmtxq+0blnxxNYDrip4joJXhtmWHBuILynuCloc9xF46+yFgt4kWR5hBqgjVjU
	UUzwFSb2t/IPTeKyDTgz3cC8320Kt983tZUWwOxvMkjK1BeJoO2F5/9xhuvILW3IgrMj7hWvOV3TD
	fO444v9Nzemr6vjIHSXeMiuPrwGmdlSCfjZlnaPv1tM1aiYNVIjDjNQ0eGWPVtFwKIo5takQw4dUL
	eycagxLOns8imlZIxuaz5P+k+AI2YXd1TODqkOMaPv80bZxRai69Z/NuP41JkUEOw3TypPSWpoVF3
	gCfe4KtWgYC2lhh4uTHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB1CM-0007Ou-Fz; Mon, 01 Apr 2019 17:58:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB1CJ-0007O0-8R; Mon, 01 Apr 2019 17:58:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id j9so13223926wrn.6;
 Mon, 01 Apr 2019 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIsstsLHXU9Ct92TAvs2WRZTq4h4a7o49yCQryjDdYI=;
 b=pCxXWN9ILOqUQtaaqVwVX5ZZudlFpiL+dAZgOHbxCj53xV2w03weIzp+0x4A8nWfP3
 KswrVT0yhtRLQ1dZrR5gTlgRZROhWGRHrCPXoq/M2/hZfuAoUSvESF2/E6afh0W8M2mu
 fPj6GpuQjFGQHLBbzaT9i6+NNr5+hxsETFl9EELM2O3/yIwkrdR8oQZpmvOtlCrrPZcC
 +L5QaeayQ+3p/zz2WBQwLUOpFtLLJsRoHcC+riZ/I83EhVB9Tvxsy0F12GH1iIukuVbL
 arpQjyejBolL680NxtNvD43FaBY/5DIozGyRgO6C9ea6C6TEOVkh0JWOISK+v4mahtND
 LDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIsstsLHXU9Ct92TAvs2WRZTq4h4a7o49yCQryjDdYI=;
 b=G4k+LGotgIY5+3blr5QiXFCfumDUMjunN1fl3DChun8hVKJ7jlkZRQJVeaI9P/JgiT
 Gla5c0+xS7HfMGg3PaLvx6HgsO0lQgLhrqYPWdYRj8mxyDJzpec5Azz5D1fFSN9uk1iP
 0sdNfMMIZ+yYWUVsjEP7NIHya7zekWL+v24jes0Mw5UnJXDPDnhaiP+cZllF2PGlv6Bi
 pQsraCFoir0jO24vehLPa688sa7Wb/1zo5Xj8IETPcoUSVI/xM3GO6RY0nJtb+xOouwt
 IHM8FGyVBA+mG99287/K5Lfj5KIqBgZR8617oOgh3rgLr9IeM20MBxr5JzG75SgxztpY
 qYkA==
X-Gm-Message-State: APjAAAVPLXAqfGc1FWKSw06NIf2bR31uOHnMtHhbl6i41o0KAQ/6L2Vp
 i4KYW+rC0HF0RDx+RH5IGeE=
X-Google-Smtp-Source: APXvYqzpRXEsO4JmSVwj8Jr9zU5efB21av7Qsv/rlpCtQ+3+BXiUG/rvftQ5mqXhFwjjbqXoQV2Q7g==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr5254195wrj.8.1554141492517;
 Mon, 01 Apr 2019 10:58:12 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73A0800C9C8A7BE25478D36.dip0.t-ipconnect.de.
 [2003:dc:d73a:800:c9c8:a7be:2547:8d36])
 by smtp.googlemail.com with ESMTPSA id
 s189sm16655340wmf.45.2019.04.01.10.58.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 10:58:11 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/1] pwm: meson: fix scheduling while atomic issue
Date: Mon,  1 Apr 2019 19:57:47 +0200
Message-Id: <20190401175748.5376-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_105815_293999_B07B0AF2 
X-CRM114-Status: GOOD (  11.74  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QmFjayBpbiBKYW51YXJ5IGEgIkJVRzogc2NoZWR1bGluZyB3aGlsZSBhdG9taWMiIGVycm9yIHNo
b3dlZCB1cCBkdXJpbmcKYm9vdCBvbiBteSBNZXNvbjhiIE9kcm9pZC1DMSAod2hpY2ggdXNlcyBh
IFBXTSByZWd1bGF0b3IgYXMgQ1BVIHN1cHBseSkuClRoZSBjYWxsIHRyYWNlIGNvbWVzIGRvd24g
dG86CiAgX19tdXRleF9sb2NrCiAgY2xrX3ByZXBhcmVfbG9jawogIGNsa19jb3JlX2dldF9yYXRl
CiAgbWVzb25fcHdtX2FwcGx5CiAgLi4KICBkZXZfcG1fb3BwX3NldF9yYXRlCiAgLi4KCkplcm9t
ZSBoYXMgYWxzbyBzZWVuIHRoZSBzYW1lIHByb2JsZW0gYnV0IGZyb20gcHdtLWxlZHMgKGluc3Rl
YWQgb2YgYQpwd20tcmVndWxhdG9yKS4gSGUgcG9zdGVkIGEgcGF0Y2ggd2hpY2ggcmVwbGFjZXMg
dGhlIHNwaW5sb2NrIHdpdGggYQptdXRleC4gVGhhdCB3b3Jrcy4gSSBiZWxpZXZlIHdlIGNhbiBv
cHRpbWl6ZSB0aGlzIGJ5IHJlZHVjaW5nIHRoZSB0aW1lCndoZXJlIHRoZSBsb2NrIGlzIGhlbGQg
LSB0aGF0IGFsc28gYWxsb3dzIHRvIGtlZXAgdGhlIHNwaW4tbG9jay4KCkFuYWx5emluZyB0aGlz
IGlzc3VlIGhlbHBlZCBtZSB1bmRlcnN0YW5kIHRoZSBwd20tbWVzb24gZHJpdmVyIGJldHRlci4K
TXkgcGxhbiBpcyB0byBzZW5kIHNvbWUgY2xlYW51cHMgYWZ0ZXIgdGhpcyBzaW5nbGUgZml4IGlz
IG1lcmdlZC4gVGhlCmdvYWwgb2YgdGhlc2UgY2xlYW51cHMgaXMgdG8gcmUtdXNlIG1vcmUgb2Yg
dGhlIGdvb2RpZXMgZnJvbSB0aGUgUFdNCmNvcmUgaW4gdGhlIHB3bS1tZXNvbiBkcml2ZXIgYXMg
d2VsbCBhcyB0byBhZGRyZXNzIGlzc3VlcyBzcG90dGVkIGJ5ClV3ZSBLbGVpbmUtS8O2bmlnICh0
aGVzZSBpc3N1ZXMgdmlvbGF0ZSB0aGUgUFdNIEFQSSwgYnV0IG5vbmUgb2YgdGhlc2UKcmVzdWx0
IGluIGJyZWFrYWdlIG9mIHRoZSBib2FyZHMvLmR0cyB0aGF0IHdlIGN1cnJlbnRseSBoYXZlKS4g
VGhlc2UKZm9sbG93LXVwIHBhdGNoZXMgY2FuIGJlIGZvdW5kIGhlcmU6IFsxXS4KCkRlcGVuZGVu
Y2llczogbm9uZQoKVGFyZ2V0IHZlcnNpb246IHBsZWFzZSBxdWV1ZSB0aGlzIGZvciAtZml4ZXMg
c28gaXQgbWFrZXMgaXQncyB3YXkgaW50bwp2NS4xLXJjIChzbyB3ZSBjYW4gZ2V0IGl0IGJhY2tw
b3J0ZWQgZnJvbSB0aGVyZSwgYmVjYXVzZSB0aGlzIGlzc3VlIGhhcwpleGlzdGVkIHNpbmNlIHRo
ZSBwd20tbWVzb24gZHJpdmVyIHdhcyBpbnRyb2R1Y2VkKS4KCgpjaGFuZ2VzIHNpbmNlIHYxIGF0
IFsyXToKLSBhZGRlZCBjb21tZW50IGFib3V0IHVzYWdlIG9mIHRoZSBzcGlubG9jayBhcyBzdWdn
ZXN0ZWQgYnkKICBVd2UgS2xlaW5lLUvDtm5pZyAodGhhbmsgeW91KQotIGNvbGxlY3RlZCBVd2Ug
S2xlaW5lLUvDtm5pZydzIFJldmlld2VkLWJ5CgoKWzBdIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL3BpcGVybWFpbC9saW51eC1hbWxvZ2ljLzIwMTktSmFudWFyeS8wMDk2OTAuaHRtbApbMV0g
aHR0cHM6Ly9naXRodWIuY29tL3hkYXJrbGlnaHQvbGludXgvY29tbWl0cy9tZXNvbi1wd20tZm9y
LTUuMi12MQpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDg2Nzc1Ny8K
CgpNYXJ0aW4gQmx1bWVuc3RpbmdsICgxKToKICBwd206IG1lc29uOiB1c2UgdGhlIHNwaW4tbG9j
ayBvbmx5IHRvIHByb3RlY3QgcmVnaXN0ZXIgbW9kaWZpY2F0aW9ucwoKIGRyaXZlcnMvcHdtL3B3
bS1tZXNvbi5jIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
