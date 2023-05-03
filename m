Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F10C77B7F
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 May 2023 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pTuKPbWQmJGnwWj2YkhpoHH+khpZFtjx4bNpO73t/Rw=; b=TL9kGRB51u5hCU
	CodD+g7BYiOTwf/9mR6IcWdBZ/9YmKnm+crxpQwRGHfPJtejW5Yr70wkFirHm1mEwr2fYJQGKA4fV
	YSh5sOIObg/4WeXEG5Fv94mma133WOGnYiLbyLW5NF9SlvBryKKoMF6g2y6lDkRLj/uUkDrnLPBMf
	w7V1Fp0A/9XmC3ys3GUNYATLquPMvy84vmC0stIphpBW8rT8oGror+K4W68GE2nDzcJnWEoAbytmZ
	N5hxTgu45d9Ze3qFY/In9mT2kgOoOsn3fjCLKaovxai/U1z8Dsi8ZzPx6Uuq/sI08T1pof6+7JEkL
	0D8nSWbLYVo+drDOyibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puIcL-005esJ-0X;
	Wed, 03 May 2023 19:58:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puIcH-005erc-36;
	Wed, 03 May 2023 19:58:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bd87539c2so3295249a12.0;
        Wed, 03 May 2023 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683143900; x=1685735900;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwruGZFr/+VxvRHZ7yoTbI/FMSH+WcULSX9JkVPhf6I=;
        b=LZzEDGQBdN0Ba4ItabfKCKinA6jrql6QSKIWGlE4TnmU/20Lfq9hcqaU2kE75LIHdV
         wuLaFv1b6fKVPXvJ7f6pVNOP0Sy688l7nZYCK9Ye19Ecd3SNYtuEhFIMoPVl8RI+xauw
         c2lhU+BZbPfmxMsPFpWSvdTBVwWx3qdZ1jyajVmKurty/xp7FxbR4wH7cIZdHgdF/7/f
         j0quAh0w7Fpl9z8M0rBeABgqpISTajGv0f86ICak+zFzrC22HdkRY8Oy9H4C+NJxWi81
         0BzwZjzQdHhozMSnTuMfnwZGryinrV1+qNFDVtvXmzvzqHtoHYrDjpB+xX2gyehngUU2
         lU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683143900; x=1685735900;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SwruGZFr/+VxvRHZ7yoTbI/FMSH+WcULSX9JkVPhf6I=;
        b=dkQcZjg+DGk75REdeyojb2WXaX2OJHmYH5Ay0AD6DLywfSoG2l16bW20n2zE241H04
         QOtTNw/jf28yGfRF/uBQcaGc6HYgUVKxiB8KGAvztaGTJ+gd78llDtm3fgaNKnM/W85Q
         8GanwvOE20O7rgpIu2V/PGmslldAkNNqWTZDr9jh6/E0AHsvk2okwn4r88LNc3UyhUVR
         OV7nOEW3irxNOdw/LlSKUGgLGNLkENFj1fXKCEZ+Noc1+XZPUbZZbJS0WOdXyNXwKGhM
         LwxLtPIS+lDJtB8RvIxJBaDUVHmvj+vua3fkJ7VoKKq+FzQUq0nIB0wJ8NnWafXwofEE
         2RmQ==
X-Gm-Message-State: AC+VfDx5hxJdwLsUz9iorsMDDj8I8sksCydpxwvj11jJH+sN0iPS/N5O
	Hz4I5km6kIdSGiENUcDYxHs=
X-Google-Smtp-Source: ACHHUZ5UwFn6M+NdYUwjvdBLmLzJCzCqZCqLFidH7kTshROl2xAOI5Z97rE2fesMcCV1t98Bf0iGTw==
X-Received: by 2002:aa7:c849:0:b0:506:83e7:8c6c with SMTP id g9-20020aa7c849000000b0050683e78c6cmr11577422edt.10.1683143899499;
        Wed, 03 May 2023 12:58:19 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7b1d:3100:e5d3:5790:75fc:741b? (dynamic-2a01-0c22-7b1d-3100-e5d3-5790-75fc-741b.c22.pool.telefonica.de. [2a01:c22:7b1d:3100:e5d3:5790:75fc:741b])
        by smtp.googlemail.com with ESMTPSA id e6-20020aa7d7c6000000b004af6c5f1805sm1048055eds.52.2023.05.03.12.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 12:58:18 -0700 (PDT)
Message-ID: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
Date: Wed, 3 May 2023 21:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] pwm: pwm-meson: fix handling of period/duty if greater than
 UINT_MAX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_125821_998057_38C20C6E 
X-CRM114-Status: GOOD (  10.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

c3RhdGUtPnBlcmlvZC9kdXR5IGFyZSBvZiB0eXBlIHU2NCwgYW5kIGlmIHRoZWlyIHZhbHVlIGlz
IGdyZWF0ZXIgdGhhbgpVSU5UX01BWCwgdGhlbiB0aGUgY2FzdCB0byB1aW50IHdpbGwgY2F1c2Ug
cHJvYmxlbXMuIEZpeCB0aGlzIGJ5CmNoYW5naW5nIHRoZSB0eXBlIG9mIHRoZSByZXNwZWN0aXZl
IGxvY2FsIHZhcmlhYmxlcyB0byB1NjQuCgpGaXhlczogYjc5YzM2NzBlMTIwICgicHdtOiBtZXNv
bjogRG9uJ3QgZHVwbGljYXRlIHRoZSBwb2xhcml0eSBpbnRlcm5hbGx5IikKQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhr
YWxsd2VpdDFAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwgMTQgKysr
KysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3bS9w
d20tbWVzb24uYwppbmRleCAzODY1NTM4ZGQuLjMzMTA3MjA0YSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKQEAgLTE1Niw4
ICsxNTYsOSBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0cnVjdCBtZXNvbl9wd20gKm1l
c29uLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCQkJICBjb25zdCBzdHJ1Y3QgcHdtX3N0YXRl
ICpzdGF0ZSkKIHsKIAlzdHJ1Y3QgbWVzb25fcHdtX2NoYW5uZWwgKmNoYW5uZWwgPSAmbWVzb24t
PmNoYW5uZWxzW3B3bS0+aHdwd21dOwotCXVuc2lnbmVkIGludCBkdXR5LCBwZXJpb2QsIHByZV9k
aXYsIGNudCwgZHV0eV9jbnQ7CisJdW5zaWduZWQgaW50IHByZV9kaXYsIGNudCwgZHV0eV9jbnQ7
CiAJdW5zaWduZWQgbG9uZyBmaW5fZnJlcTsKKwl1NjQgZHV0eSwgcGVyaW9kOwogCiAJZHV0eSA9
IHN0YXRlLT5kdXR5X2N5Y2xlOwogCXBlcmlvZCA9IHN0YXRlLT5wZXJpb2Q7CkBAIC0xNzksMTkg
KzE4MCwxOSBAQCBzdGF0aWMgaW50IG1lc29uX3B3bV9jYWxjKHN0cnVjdCBtZXNvbl9wd20gKm1l
c29uLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCiAJZGV2X2RiZyhtZXNvbi0+Y2hpcC5kZXYs
ICJmaW5fZnJlcTogJWx1IEh6XG4iLCBmaW5fZnJlcSk7CiAKLQlwcmVfZGl2ID0gZGl2NjRfdTY0
KGZpbl9mcmVxICogKHU2NClwZXJpb2QsIE5TRUNfUEVSX1NFQyAqIDB4ZmZmZkxMKTsKKwlwcmVf
ZGl2ID0gZGl2NjRfdTY0KGZpbl9mcmVxICogcGVyaW9kLCBOU0VDX1BFUl9TRUMgKiAweGZmZmZM
TCk7CiAJaWYgKHByZV9kaXYgPiBNSVNDX0NMS19ESVZfTUFTSykgewogCQlkZXZfZXJyKG1lc29u
LT5jaGlwLmRldiwgInVuYWJsZSB0byBnZXQgcGVyaW9kIHByZV9kaXZcbiIpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKLQljbnQgPSBkaXY2NF91NjQoZmluX2ZyZXEgKiAodTY0KXBlcmlvZCwg
TlNFQ19QRVJfU0VDICogKHByZV9kaXYgKyAxKSk7CisJY250ID0gZGl2NjRfdTY0KGZpbl9mcmVx
ICogcGVyaW9kLCBOU0VDX1BFUl9TRUMgKiAocHJlX2RpdiArIDEpKTsKIAlpZiAoY250ID4gMHhm
ZmZmKSB7CiAJCWRldl9lcnIobWVzb24tPmNoaXAuZGV2LCAidW5hYmxlIHRvIGdldCBwZXJpb2Qg
Y250XG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0JZGV2X2RiZyhtZXNvbi0+Y2hpcC5k
ZXYsICJwZXJpb2Q9JXUgcHJlX2Rpdj0ldSBjbnQ9JXVcbiIsIHBlcmlvZCwKKwlkZXZfZGJnKG1l
c29uLT5jaGlwLmRldiwgInBlcmlvZD0lbGx1IHByZV9kaXY9JXUgY250PSV1XG4iLCBwZXJpb2Qs
CiAJCXByZV9kaXYsIGNudCk7CiAKIAlpZiAoZHV0eSA9PSBwZXJpb2QpIHsKQEAgLTIwNCwxNCAr
MjA1LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2NhbGMoc3RydWN0IG1lc29uX3B3bSAqbWVz
b24sIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJCWNoYW5uZWwtPmxvID0gY250OwogCX0gZWxz
ZSB7CiAJCS8qIFRoZW4gY2hlY2sgaXMgd2UgY2FuIGhhdmUgdGhlIGR1dHkgd2l0aCB0aGUgc2Ft
ZSBwcmVfZGl2ICovCi0JCWR1dHlfY250ID0gZGl2NjRfdTY0KGZpbl9mcmVxICogKHU2NClkdXR5
LAotCQkJCSAgICAgTlNFQ19QRVJfU0VDICogKHByZV9kaXYgKyAxKSk7CisJCWR1dHlfY250ID0g
ZGl2NjRfdTY0KGZpbl9mcmVxICogZHV0eSwgTlNFQ19QRVJfU0VDICogKHByZV9kaXYgKyAxKSk7
CiAJCWlmIChkdXR5X2NudCA+IDB4ZmZmZikgewogCQkJZGV2X2VycihtZXNvbi0+Y2hpcC5kZXYs
ICJ1bmFibGUgdG8gZ2V0IGR1dHkgY3ljbGVcbiIpOwogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0K
IAotCQlkZXZfZGJnKG1lc29uLT5jaGlwLmRldiwgImR1dHk9JXUgcHJlX2Rpdj0ldSBkdXR5X2Nu
dD0ldVxuIiwKKwkJZGV2X2RiZyhtZXNvbi0+Y2hpcC5kZXYsICJkdXR5PSVsbHUgcHJlX2Rpdj0l
dSBkdXR5X2NudD0ldVxuIiwKIAkJCWR1dHksIHByZV9kaXYsIGR1dHlfY250KTsKIAogCQljaGFu
bmVsLT5wcmVfZGl2ID0gcHJlX2RpdjsKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
