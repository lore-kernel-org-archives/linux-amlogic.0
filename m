Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2411DCD1284
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2024 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnWl3g9HHxCDxVpmmIT22kUuarEVLK+niK0bTv5VRkQ=; b=MH30ggPtt6/Ilx
	RFyBSs7K2IPyVPduk9NbIDH/aumVMhyYlCfE4O9UianTcvuzzKbsbOxBO+//6ZCD6nA0o10wuCpmf
	xkO72CM6OBnvAzTKjU19tnqyjUEdN4elt4XFvkdx1IdfCE4rhyP2vkZgaf77tuZ8UDw7Q/2zuPLok
	qpDJ+hMIkQHf8LfQKjoZlxe+T7XUP3vnUy+prFAoik/y12hcWu/0pjcWxdoTlMk50nONkcK2fyrXL
	Ny6IJ6jduAXyptevw0Pvo+54J5TDone0613LcD2fvAko6Qfh7q4Rul0GifkPYAd4gQaHmDbPH81vx
	aQTt9u8ZjKzHQpf6Blkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM7v-00000002ZiF-3po2;
	Thu, 04 Apr 2024 12:23:31 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM7q-00000002ZgI-3qs5
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Apr 2024 12:23:28 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d6a1ad08b8so10483171fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2024 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233403; x=1712838203; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYE+eshATYqsMOTO3OJcrLKHBczJOSqmODQnoMCtRas=;
        b=GAvvaL7VuE6+I0i6s3AzOcrjhg0Btsdroc+qq480LywnqlmgFth70/M2+nlnYs9R2a
         gUFBEqFQYS8n6yAEiOUNlbdgu8pOgUotTeMD5lzF1l00SJka1IPTUfVYiwvKhXogUGWJ
         a5JjGo1D9cFLELBXntBltBMK/VOy/Cu0JgiZ4zclCD2jDFMy61xlf4qLyGhN5WsSlkoU
         HxdapfII7zIaNUmFLcAcni/39q2SZtHGEA0u4DmhfF9qIbgKXZSJWs5e0VIRltHWhPLd
         hOSHbit5kKuFGS3U/G8+wsDyU3NtNbXIJHXKtPoYXpwZArXGf+V00UqmbPJdPrFQJF5Q
         4w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233403; x=1712838203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYE+eshATYqsMOTO3OJcrLKHBczJOSqmODQnoMCtRas=;
        b=vtr7qgzwF27WlRX/QKnailCWUSgMsSqj0YagJ7yNlCp+g67zay+fCB6QeRiJHanRvC
         IfWb1LNB/8hvnDpdff8OT0RER26ZI8jd4ildY0HOLUrrSIK2HQrgehOoYN4Fr2ANKIQp
         TvL1J4THiAA0N3Opxyt/Qi+caHTUmeoDe9j7AWM8KFmuFHxgJxOksoTeW2H4mwiizq7Q
         P52ONrIylD44TWvCZHZnSZ+BuG5ElVCzHi882MDgqjnUJ3RPWYd67wzZNjb0DUOE++ov
         9SYHVvzwffiRqms3OIK3TqAZEhhSXkzYQNCANnwOgcHpWaJa8JAhNTHqAIBo+3hJLTbo
         B3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGTi3TUwykxrsUfhHKChhoGDSpYpbhh8h6daEVc7Jweyd/0rCLlVDNL2fQz7bN73QwSxP/ynMvvdHXMqySqX18ZK8z5UHqmNn+dkldo3JqNtQ=
X-Gm-Message-State: AOJu0YxLiL84qtCjI1I5uL320gOnD7oR0cx9xTFzz8rCEwhTSf1pRBB+
	09psg2SKWUZDfV9w0upcgNoIdjM2BOKa7R+5iGdZoXHc3M76B/nI4zzKfgUAQEY=
X-Google-Smtp-Source: AGHT+IHAr8zPO653SUr6XFqHyuFMhuWhZMQKuK8meJtxtbXfUpmzEPy7h6Ezmtdi77EyE7t19gkTfw==
X-Received: by 2002:a2e:a371:0:b0:2d8:4c9f:ed94 with SMTP id i17-20020a2ea371000000b002d84c9fed94mr1906339ljn.34.1712233402988;
        Thu, 04 Apr 2024 05:23:22 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id b17-20020a05600c4e1100b004148090cf86sm4646300wmq.0.2024.04.04.05.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 05:23:22 -0700 (PDT)
Message-ID: <38ba3618-2a67-4e21-b08d-7e382411e51a@linaro.org>
Date: Thu, 4 Apr 2024 14:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thermal: amlogic: introduce A1 SoC family Thermal
 Sensor controller
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@salutedevices.com>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, glaroque@baylibre.com,
 rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240328191322.17551-1-ddrokosov@salutedevices.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240328191322.17551-1-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_052327_000468_EF44AEE6 
X-CRM114-Status: UNSURE (   6.40  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjgvMDMvMjAyNCAyMDoxMywgRG1pdHJ5IFJva29zb3Ygd3JvdGU6Cj4gSXQgaXMgcHJpbWFy
aWx5IGJhc2VkIG9uIHRoZSBHMTJBIHRoZXJtYWwgY29udHJvbGxlciwgd2l0aCBvbmx5IGEgc2xp
Z2h0Cj4gdmFyaWF0aW9uIGluIHRoZSBvZmZzZXQgdmFsdWUgb2YgdGhlIGVmdXNlIHBhcmFtZXRl
cnMuIFRoZXJlZm9yZSwgdGhpcwo+IHBhdGNoIHNlcmllcyBwcm92aWRlcyBhcHByb3ByaWF0ZSBw
bGF0Zm9ybSBkYXRhIGFuZCBkdC1iaW5kaW5ncyB0bwo+IGVuc3VyZSBwcm9wZXIgc3VwcG9ydC4K
CgpBcHBsaWVkLCB0aGFua3MKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAg
PGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDov
L3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
