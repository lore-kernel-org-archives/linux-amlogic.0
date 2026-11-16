Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660A660A262C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 23:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2cofNWy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JnTTdhMB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2OcYwDMgPZl2zxd/culIkpzQ5zzQxHJNlVsRATEdBTs=; b=i2cofNWyJgey35tsVRAwts0f+c
	NItr5s7G89K6ONsKPiECfTgQe0CtkgURXvmeJEwZ/Xa+0y6sHHs6urleZetmH568EhaijMpoWW8JG
	mXF6MjTV3s+oTnw643UDF7L4jIPu2z/ZNsz5HNKKzBOT2CJVpu/u3Cs+a6IzORgexyCGSuea84ALq
	GCxlIng8yj1LgbfRGRyM9aR4X3t+dyJKGdelhpRgrHhwVv/kZK2kGQU8xgIqncQv4zcJbYsWf8+DF
	YMBOi38IdsrhY+SRvntLYazjCkhE7lvPbyKpVFntcFYRaPR3uTpi4Av34eas8yaeX4t5sTKmXnP6f
	7LhS9C6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5mk-000000046ZG-1V55;
	Mon, 16 Nov 2026 23:06:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5me-000000046XP-3FX9
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 23:06:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2244601f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2026 15:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794870402; x=1795475202; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=JnTTdhMBr/URuqr5J5FE27sXKppYj+d6W1dXSnn+lt6eE19bHlgvi1mZ2VpRbmSZ2L
         /IrsFX3iEpY0TIK2x6yuEb06NmXrijMaVgem9njl/WMQVoBInaF1vOHgBpb5Q94wbD04
         sScpFNe19cXRPD7mLoy4CK0oblRDrKpM+i2zyRchbtCVIX5SqB3x3Z4EwZxnEKAM/8tH
         jBl3Pf59XEpuP4CmfozQJsAIh03aWGv8jfxNVRi8q0aeOwHGfEp6FtFXYwhMDnCvXmC4
         /sIyyLqkbDv2speqkei/dnCHgDaEx0temiPjapj8sy2GiSGzJP+Zm4tzQCEXsYv8K5im
         NS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870402; x=1795475202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=A5dgt42/StLDeFXQskYnuBqwvLuF/U0zBewXfqC1qFXMs0hQHL8fSDH9ZKGLTFkf5S
         uFtxUUxfO879YhOF6/PmXmloMfmNITdJl4owskzIvoGlketwUmEa7CbbONZa6o2ue4PF
         5wb1Uh5DG/B7gCDuFEul83rY9ohglXAWS6QB+D6cJB7tBQjuncPSjFhRhWJwr/yc7Myj
         eCbJavRpTb0KmQjkpHWFH4uhL/QnRyimdBwE02/tKFXlg5BGPWnYwdQ2WVCC7Sxqp0sg
         jQM8CWELI5o8/o1t5ku2UBPWt837MC0z+ZoMpvU3JgwAuauTw2xQY9ArR/z46wW7RFzN
         uuJw==
X-Forwarded-Encrypted: i=1; AL+hErF5YOvZx9T1rIwPwWcxO5xIeHVKWjr5g+7pb85i82P837qKFa3qdvVDM/7+zf0ILMMK4fL4y7lnToSoPdpU@lists.infradead.org
X-Gm-Message-State: APuU4Z+hWeziOMSL6p6i6O7X+2X2aBXRbDLX8De75Xr0BkQu3CZgyHdv
	kLPcACj/G2r6SiYU2gaDDqypqJcHnL694g/M6nS8//FmhMIOzS98TLYcKf+HupNKqjk=
X-Gm-Gg: AZFdTZeIbdWziYIedmJ5R7gi2uLBEr+/EqrH8ioMYEn/mIIf4vPY13EBNAdYdvL/b8y
	tVV/qEthbNqXgs5EXiH0qrbbd9Or1tGJwF/kwt/tpfh0oDDfjWh9UshK/5KhK3CBchWtevMHT0V
	OF0ig42lK3DOOoZmeSrG4GZNiS3ogu782ob05IWpas3COdCPfSzuoE5CFf7FFnrlb7cs0F0DoC1
	SEfzT3F3EIUnUpaFrjz9oQZtbpSL6VodKoehSMV6jImDE+MFBAjRV+3jKwE6tcdE84VP16CvRGf
	QJy5huhlwW1bswuYh9A7u3Ww31EjVTs0oWkg9L8Nf34KcsdE3haEoCEQHkkpAObhoVispgCItoW
	9gKUJkCHK7/cQfwkeH1iJ0PSEnSV+SJhpmX272cR1YQhL0zabr4ej5yqYzqfw3tb3Voo7AeDQA0
	zCEotdFyDVJhYVjSMry1co2YMzbJ/GBDSlXNpvfKaM9K9vOYCn5Ujh6crk8p1tG/NcFPKWTmoyd
	xI1LzNK/FBK+aBv+ZmtrHrE6VK82epqo+B8uuCfBiDDoAUSfgp9RGZO/RNa7DcElweXyEGDTvgT
	6XKzy38gulldXswXMzLYcuhB+oL7VvHl
X-Received: by 2002:a05:6000:2288:b0:49c:6a45:ca33 with SMTP id ffacd0b85a97d-49c70ed923amr27070236f8f.9.1794870402452;
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm24359908f8f.18.2026.11.16.15.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Message-ID: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
Date: Tue, 17 Nov 2026 00:06:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150645_400065_73D528E7 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTUvMjYgMTA6MjggUE0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gT24gU3Vu
LCBPY3QgMTgsIDIwMjYgYXQgMTI6MTjigK9QTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGli
cmUuY29tPiB3cm90ZToKPiBbLi4uXQo+PiArICAgICAgIGlmIChneF9jYXJkX2NwdV9pZGVudGlm
eShkYWlfbGluay0+Y3B1cywgRFRfUFJFRklYICJneGJiLWF1ZGluIiwgIkZJRk8iKSkKPj4gKyAg
ICAgICAgICAgICAgIHJldHVybiBtZXNvbl9jYXJkX3NldF9mZV9saW5rKGNhcmQsIGRhaV9saW5r
LCBucCwgZmFsc2UpOwo+IEkgc3VnZ2VzdCB1c2luZyB0aGUgImF1ZGluIiBwcmVmaXguIEFJVSAv
IGF1ZGluIHNlZW0gY2xvc2UgZW5vdWdoIG9uCj4gYWxsIHN1cHBvcnRlZCBTb0NzIHRoYXQgd2Ug
ZG9uJ3QgbmVlZCBhIFNvQyBnZW5lcmF0aW9uIHByZWZpeCAgaW4KPiB0aGVyZSB0byBoYW5kbGUg
dGhpcyBkaWZmZXJlbnRseS4KCkRvIHlvdSBtZWFuIHVzaW5nICJtZXNvbixhdWRpbiIgaW5zdGVh
ZCBvZiAibWVzb24sZ3hiYi1hdWRpbiIgZm9yIHRoZSAKY29tcGF0aWJsZT8KSWYgc28gSSdtIG5v
dCBzdXJlIHRoaXMgaXMgYWxsb3dlZCBub3dhZGF5cy4gQXMgZmFyIGFzIEkgdW5kZXJzdG9vZCAK
Im1lc29uLGFpdSIgaXMgYSBzb3J0IG9mIGxlZ2FjeSBuYW1pbmcuICd3cml0aW5nLWJpbmlkaW5n
cy5yc3QnIHNheXMKCiAgICJETyB1c2UgYSBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZSBmb3IgYWxs
IFNvQyBkZXZpY2VzIFsuLi5dIgoKLS0gClZhbGVyaW8KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
