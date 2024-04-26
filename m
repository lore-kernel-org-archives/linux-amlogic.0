Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D80C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XSwbm7AH7fDW5Xpfa283zbKg+ev47i6wnYMN2ZFEik=; b=Pp+JZdrhgtvp/7
	h81mWeAtzHxJbrqIl4G0iXYiQrZu9SV21pkRCVq6Ma5mMtpmZmBKJtG8CEDRK53qJNRKLOH/V7nor
	5iOm4ZHfL6B9fk0OylMo74Fb92StbDhNLmBY34WKtRDgCNqHlnNWJHPVztivKwon2xVFVGquWw7mj
	3eZvC4stXX1z+zbKoS0LSFNt1KYfk0vqcGZB5ppAotgRA1iYWN1RQDQQAl2OLVmjmem388NluTiJ/
	Ve19pYBN21Ks+kGsFZXKMdnQ3ahV977ZmMPTzfmFnK/tNsBFiIyFEN/bVWI6w7jp4U5FwpEz0E1g8
	7OVTx2QdEfYiSczHvY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GSi-0000000BYhg-1eoO;
	Fri, 26 Apr 2024 07:57:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GSe-0000000BYgN-3190
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 07:57:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41b782405bbso5055425e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714118251; x=1714723051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=392YvKHUy01C2ane9PlBGjbFseGqGwG2sSPnV1+h06o=;
        b=nz0hy4GNozsHHWi7otOV7bUQxldMH0UXDRTtyX6ZKVwQxIJ4UZw7zO3ntvVxldAE+C
         xeJrcZ2WyJuxnvzbz2T0YFueouTxX9GVFv65z76qjB3tQrgD0FSiJkkceMolcfBxcZ1f
         yoZN1QPNNYZGK++BBwTVEXZZ5FpJj8GicB+gFhqZ5D6qRIYF/OOq4DP9YR5l9y385MCD
         /Y/PcY+WpnkaVKrzwSwOK7h3ulS3gzkDTQzZ7OvVpzH27S0dZJImINg+DjBGcrtkrf2e
         qTvqQX/hxrgpuN+g0Wr65ZFTsQiNGXpYXZMFOx0zRCZl+dp9h5rP8UssOq34TNK3AjkX
         FEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714118251; x=1714723051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=392YvKHUy01C2ane9PlBGjbFseGqGwG2sSPnV1+h06o=;
        b=XHH6a39Qz/PXmHEGTL7ZZfSGSwBydckEXqq7KzRQoKuXpyylMEgCVMeUFKQh3lAskY
         FTLXhBpwpWB5hRgljgbX9QoGhXazD7gYAGUnXycIJZjYInLT36ye3Ecy48fMycgaFsxQ
         sxFdjumqqc4MCRd0eI2KL0ucCXg8TMEjjeLwV3fKDadKLm1/QNBY6MzLFMEQC20KblqH
         tSB2ogxmQ6BQTu1REkpvWqPycQdLQfC1bmZZtTHORnQStJsxchzxtjWOXC9A1k+6ZFvX
         LUi1GFXW+/JYz9QwB7Sh5UEcvsZkRUk+FrU6o6eCOqte7WNLUqxZCPXQZ29h77qWb1Wy
         WIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa842XCZ0SJ7MH2Fj72lFFQQpAa6bJCZbPxmWJqPpJ6pJvQy4xrsdhCS/8rNXv+ce6tk28JCJ+r+6W3GyIMJ8xsJavUVczcUlOgoafZ0bcOmQ=
X-Gm-Message-State: AOJu0YwA6EQyjeQg6AX82fFSEb28y5+1rMIPiCxosbSQgFfyguApaX+0
	Hdng66/MWCXUAPPjFuGK9GcZH8dsVCOZ0j2fpOURF8lsn1ovVCkIZelgdEaGFt0=
X-Google-Smtp-Source: AGHT+IHIONkocekx1Nn0xgOaZLdkdZ6ZhZ+MdaNtdhL8VruI6qSiOgyFn8JkOr6Ws3rcaZt3necsIA==
X-Received: by 2002:a05:600c:19d1:b0:419:f126:a46d with SMTP id u17-20020a05600c19d100b00419f126a46dmr1373777wmq.30.1714118250865;
        Fri, 26 Apr 2024 00:57:30 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id f7-20020a05600c154700b004190d7126c0sm25350832wmg.38.2024.04.26.00.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 00:57:30 -0700 (PDT)
Message-ID: <35c9dbe9-9166-4358-bfa9-99f205acd8de@linaro.org>
Date: Fri, 26 Apr 2024 09:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thermal: amlogic: introduce A1 SoC family Thermal
 Sensor controller
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@salutedevices.com>, neil.armstrong@linaro.org
Cc: jbrunet@baylibre.com, mturquette@baylibre.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, glaroque@baylibre.com,
 rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240328191322.17551-1-ddrokosov@salutedevices.com>
 <38ba3618-2a67-4e21-b08d-7e382411e51a@linaro.org>
 <20240417084007.uzg2uc7gwb6mi7bi@CAB-WSD-L081021>
 <20240426073106.3yl2dplvauper3lg@CAB-WSD-L081021>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240426073106.3yl2dplvauper3lg@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_005736_769862_5FCDAF49 
X-CRM114-Status: GOOD (  11.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CkhpIERtaXRyeSwKCk9uIDI2LzA0LzIwMjQgMDk6MzEsIERtaXRyeSBSb2tvc292IHdyb3RlOgo+
IEhlbGxvIE5laWwsCj4gCj4gSSBob3BlIHlvdSdyZSBkb2luZyB3ZWxsLiBJIHdhcyB3b25kZXJp
bmcgaWYgeW91IGNvdWxkIGFzc2lzdCBtZSB3aXRoCj4gYmVsb3cgcHJvYmxlbS4KPiAKPiBJJ20g
YSBiaXQgY29uZnVzZWQgYWJvdXQgd2hpY2gga2VybmVsIHJlcG9zaXRvcnkgdGhlIHNlcmllcyB3
YXMgYXBwbGllZAo+IHRvLiBJIGFza2VkIERhbmllbCBhYm91dCBpdCwgYnV0IHVuZm9ydHVuYXRl
bHksIEkgZGlkbid0IHJlY2VpdmUgYW55Cj4gZmVlZGJhY2sgZnJvbSBoaW0uIENvdWxkIHlvdSBw
cm92aWRlIHNvbWUgY2xhcmlmaWNhdGlvbiBvbiB0aGlzIG1hdHRlcj8KPiAKPiBUaGFuayB5b3Ug
aW4gYWR2YW5jZSBmb3IgeW91ciBoZWxwLgoKSSB3YXMgT29PIHRoZSBsYXN0IHR3byB3ZWVrcy4K
CllvdXIgc2VyaWVzIGlzIGluIG15IHRyZWUgWzFdLCB3aGljaCBpcyBwdWxsZWQgYXV0b21hdGlj
YWxseSBieSB0aGUgCmxpbnV4LXBtIHRyZWUgaW4gaXRzIGJsZWVkaW5nLWVkZ2UgYnJhbmNoLgoK
VG9kYXksIHRoaXMgYnJhbmNoIHdpbGwgbW92ZSB0byB0aGUgbGludXgtbmV4dCBicmFuY2ggWzJd
IHdoaWNoIHdpbGwgCmFsc28gYmUgcHVsbGVkIGJ5IHRoZSBsaW51eC1wbS9uZXh0IGJyYW5jaCBh
dXRvbWF0aWNhbGx5LgoKSG9wZSB0aGF0IGhlbHBzIGFuZCBzb3JyeSBmb3IgdGhlIGRlbGF5IHRv
IGFuc3dlcgoKICAgLS0gRGFuaWVsCgpbMV0gCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RoZXJtYWwvbGludXguZ2l0L2xvZy8/aD10aGVybWFsL2JsZWVk
aW5nLWVkZ2UKClsyXSAKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdGhlcm1hbC9saW51eC5naXQvbG9nLz9oPXRoZXJtYWwvbGludXgtbmV4dAoKCgoKLS0g
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5j
b20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJv
b3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
