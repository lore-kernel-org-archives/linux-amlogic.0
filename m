Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A4CC77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 May 2023 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nLGTG4HwxW7zd6EuSRgVzcTkBzlpjI91duBiD81Vco=; b=qipJry+cmKPstd
	vgtEKj9VlNmuSZkj/NYEWQGFXkYCFPiuDJ2jys8q39r/QyZY0t78BBl7iL5+YiaBQ0NBZ3bKzvNZs
	W9hY4bDW5QaCL9A8fyCmxtmtE4Xldx7fqt2hgBlyDUhkisPHORwN86MutZlMSGPIqjmFyMu/SCGdz
	O1sC5rgrZ2yhSabqGp3tWHYwcNpToDy+fxdOO4Yf24RznfPCelMrPuGPNPTHRUTSkC3uXY8joI0rX
	xwHCriF4umW9GWkNWL5nebcmpCmjqe+DnoUr5umi4I2O5x6tpR7IUJp9zt3Lz+FCp3EboKAf9EIC+
	ootULm9HY3oIsuHFUciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXX-00EWMx-1A;
	Wed, 24 May 2023 19:52:55 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1uXO-00EWCj-0x;
	Wed, 24 May 2023 19:52:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510eb3dbaaeso2687865a12.1;
        Wed, 24 May 2023 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957961; x=1687549961;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huiHW4dncLR47flGGAupi0WrSV1QYNNVKtZqQryUTzY=;
        b=dsrlahShI+oOFmQGiaxR6DL1/8uRWGER0QU0YNaZMN0E84+iFYiQAjqDVpxTPe6ymI
         C9JJIySL6OJj3yOF9TrvuEMiL08h1tANYfc2EEUce4QDUgl/WBh2flHOsPrWK9HKA4sO
         m+BNKNFRpHUjVGREE+Ja70P5Dk7oid7btIO9Avy47mFNMcv/6Eskinmyxoa4riz2xpZb
         nXlUbPJae8kmsvcjy9IuRIX7Qvz+ffAXKLbONIQX2NTlWxCIteBerkHgSQZPSgDf9TsI
         2bduq9qoZe/7RnK4Si7rt4eZPs1RApQq5qHAxAtsq7hqbyWa02L7vnVXD7riM1DYbdIE
         U8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957961; x=1687549961;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huiHW4dncLR47flGGAupi0WrSV1QYNNVKtZqQryUTzY=;
        b=QYJtJ9OZAvKv7GmHRwv1Jo/c7qViXZesrdKyGMUepP36A0vrfPQ6nVYvqcyLjszI3w
         MAMIrc+CWDPmw6Nch39kvD2FPKq9dDIKpF7i0NADwB8pCA3ltbIk1Y1YT8iM24iOg1uo
         3nVuJpLbvxD/fy+Z0mLyJ/Iya3dwceqfDwv5dA/4nAOFTTMgeJ8zvWYp2d/MJGGemdfp
         FKbVNaO2fR89X8wZXAJ8sZ+Hyi217NJQpljSTBgVkVbotPcixypfIFcaYYAnBHhwFabF
         3EDJeXennQ/PC/F6aXVfq7GyA1ceXUqsePmud2/nEFUHKw87k73WxNWoQ7ueYcygJ2bc
         upnw==
X-Gm-Message-State: AC+VfDzQirufZf2V6mhdFaVrvuY92+fQYaUnYcwSYjbFHMz/iVP6h7H4
	eIJe5dZncXzkmv+9eZ5KafgBMgeeCFw=
X-Google-Smtp-Source: ACHHUZ5R3W40IgcQ1r4eOjPc+CNdCENjaL837ZQ/cOoRzFvhp9Lo1Fu9x7WUx6yT7JP3w8IPi8KeEA==
X-Received: by 2002:aa7:df0d:0:b0:510:b636:4073 with SMTP id c13-20020aa7df0d000000b00510b6364073mr2698727edy.3.1684957961621;
        Wed, 24 May 2023 12:52:41 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c519:9c00:cd4b:d130:35c7:5e08? (dynamic-2a01-0c23-c519-9c00-cd4b-d130-35c7-5e08.c23.pool.telefonica.de. [2a01:c23:c519:9c00:cd4b:d130:35c7:5e08])
        by smtp.googlemail.com with ESMTPSA id d8-20020aa7c1c8000000b0050bc6983041sm236985edp.96.2023.05.24.12.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:52:41 -0700 (PDT)
Message-ID: <c6d59480-df25-9244-82ec-fcd26dbe5022@gmail.com>
Date: Wed, 24 May 2023 21:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH v5 RESEND 3/6] pwm: meson: remove not needed check in
 meson_pwm_calc
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
In-Reply-To: <aa498590-261c-4ada-63ff-8d7aaeec0932@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_125246_336666_30A9FDE5 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

cGVyaW9kID49IGR1dHkgaW1wbGllcyB0aGF0IGNudCA+PSBkdXR5X2NudC4gV2UgdmVyaWZpZWQg
YmVmb3JlCnRoYXQgY250IDw9IDB4ZmZmZiwgdGhlcmVmb3JlIHdlIGNhbiBvbWl0IHRoZSBjaGVj
ayBoZXJlLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2Vp
dDFAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jIHwgNSAtLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdt
LW1lc29uLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwppbmRleCAzMzEwNzIwNGEuLmFhZDRh
MGVkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKKysrIGIvZHJpdmVycy9w
d20vcHdtLW1lc29uLmMKQEAgLTIwNCwxMiArMjA0LDcgQEAgc3RhdGljIGludCBtZXNvbl9wd21f
Y2FsYyhzdHJ1Y3QgbWVzb25fcHdtICptZXNvbiwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJ
Y2hhbm5lbC0+aGkgPSAwOwogCQljaGFubmVsLT5sbyA9IGNudDsKIAl9IGVsc2UgewotCQkvKiBU
aGVuIGNoZWNrIGlzIHdlIGNhbiBoYXZlIHRoZSBkdXR5IHdpdGggdGhlIHNhbWUgcHJlX2RpdiAq
LwogCQlkdXR5X2NudCA9IGRpdjY0X3U2NChmaW5fZnJlcSAqIGR1dHksIE5TRUNfUEVSX1NFQyAq
IChwcmVfZGl2ICsgMSkpOwotCQlpZiAoZHV0eV9jbnQgPiAweGZmZmYpIHsKLQkJCWRldl9lcnIo
bWVzb24tPmNoaXAuZGV2LCAidW5hYmxlIHRvIGdldCBkdXR5IGN5Y2xlXG4iKTsKLQkJCXJldHVy
biAtRUlOVkFMOwotCQl9CiAKIAkJZGV2X2RiZyhtZXNvbi0+Y2hpcC5kZXYsICJkdXR5PSVsbHUg
cHJlX2Rpdj0ldSBkdXR5X2NudD0ldVxuIiwKIAkJCWR1dHksIHByZV9kaXYsIGR1dHlfY250KTsK
LS0gCjIuNDAuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
