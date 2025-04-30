Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62BCC369D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Apr 2025 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9Zy22kZLtHNYwASrtqVsF92knQxVwqJGeuXTkpAcTQ=; b=ahGN2TvkxMRgbl
	QN1uPTPsxtwFU6jrYz5ID4At1naEx8JK5xuIdWju9y+n+/XuMv4BIF1kALNXSbx5ozm418j+q+Vvg
	WfyKoTNo0FC6Xoiad8FeQ4iuRT8hdFv9INNeWbuQcl1AjUmCmJEHEwDSBdCie9RXpe1ff3wH+bvU7
	c6oLyAW1aGc7RuX3XEj1QLN+xKtAWGJTxJsZFpmIGqc+/hHYdJvdFOSrBev38Imu7cvoBzcXgW2oA
	+7vAEdeyzi7aRtK4zzUK8lRYnNb0tnF4wgt05oZ8HN+2fRL4tVdL6rzypTJRmNPo/LGhKN6jGpBLD
	1LZVr89EocusPMGmWFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3pO-0000000CNi1-2pOP;
	Wed, 30 Apr 2025 09:34:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3he-0000000CM09-3VMz
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Apr 2025 09:26:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso30941275e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 30 Apr 2025 02:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746005165; x=1746609965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gg8+U7uhajg2zvUCUMrdqQmupPgIClRDIQQD6o+TZVs=;
        b=wg5N5LDWDmi6CFYVB0YtHu3+7PctlCYfTo6HZRR+OMpny8V+6EWpwiguOttIvvI6Sf
         E7SkIXq9bnWWey20JIMX+mtbv+ceW3NYBBcmXTmNbNNJLN2D3Xd+gscaacX/g5zoQfOf
         pXUqCif+jVXt07BDtUbjTWaHy6ulpchk35O1orJHPisGsZXke5CTTJ6dKdv8Dru/nMf+
         JVabFOPQUSftbqIRYDQ3Mh5PQiV5TpgLsVyTox/tXyxFB+qWyRFnR/oEBdIRUSlxabho
         +qc1PFjQA5BbcVfbpKpJnLmIcVzKf/owDaof8GkXSvpVbdy5Lpv0OLwHUUav9YpTuSn7
         01Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746005165; x=1746609965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gg8+U7uhajg2zvUCUMrdqQmupPgIClRDIQQD6o+TZVs=;
        b=gKzMNwMPdtd3okGE/kmLQorF+a4R7eVZAT6U+46IIMbtUAtSiZuEdSBLNDCWP6qlSj
         x1+aNufFAj+nyDvhWdnP7Cwip5J4/eZVaHG4wl/ntKNPZhOuvpt8U/L5SzQy/y9+xe24
         JZZYkYZJztVF9ftU5LdRku/2mEuwbj4ZKt0BytZFMVPS51W/L/gGX6OfQbcp5idil7nz
         8mU9VF0ZEKH7/2ldA5eu9BpTIY4LpuW6c1TDaI8LEJUSP1cxx6wsvMfcv0SciOrqv6S/
         lB/v9iidgOUERr6yOnbLljkoEV2LPC97szbsG8NrrKsk2wHdNUvKsQ0h7/g2+r6Ea4l2
         mfgw==
X-Forwarded-Encrypted: i=1; AJvYcCUi5JoPLKviha05JZW3S1A2pLPfvJ1ojxdJe2HG8qr1edt0UL8NHtHc7dknQBzibQVj2hFObTg7AC2/0lM9@lists.infradead.org
X-Gm-Message-State: AOJu0YwHg6Rv2CmcS4HSuA7ZH1dMDPrC6auUgd0ikmY3EYy2qPmDZijg
	51tKQxRDmlwEiuqAznCcvBkj03vS4K3fLtic7ql9ZqeITduX8z2h9A9xIJsB1YQNbM0+iwx2k7i
	y
X-Gm-Gg: ASbGnctYUf7MoRMg16EWC3/ns8/ttvvlV/cH2elTLChFCbaYh8KgKhgxe/4ozWlieFU
	vMFR6bzjtJOu8/5rGXrl1TCbQ+we2JsgXMZK5OA0tigPeupSrzeVZmRPyDqsFHf5ve7SdvxdlRt
	ogOSkq6x1O6ygKOCdq7bnQmp6y7hifi+nY4/9/yMI/xgL1b1pp39qxHtWdUagCOX3Xk0WCYf5KK
	PCKkve2/jRPr5Cv6guYIzJplaQP8cDMGPtIoJ6oyv6LfS8WeUzq9dEfoE1oW7XFqIdYGTgUvHYU
	LmZrdnaDyxk4i6p6okhAxJ0BjZGpYNZBYC5qdqwOkZLa0+FyAwfK7cG8RnYQsF9W/NlhZUc0v9P
	143yk
X-Google-Smtp-Source: AGHT+IGeU+1g/ZzusMepn3Swj4cy0n4ZXYGf5XGELdjXdxHsUaERxZxPSUk0zKSfnUqF6M2pw81X1A==
X-Received: by 2002:a05:6000:4287:b0:3a0:6b91:fefc with SMTP id ffacd0b85a97d-3a08f7d22d8mr1934468f8f.50.1746005164916;
        Wed, 30 Apr 2025 02:26:04 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm16614490f8f.15.2025.04.30.02.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 02:26:04 -0700 (PDT)
Message-ID: <542d80c4-edba-4b5a-a47e-8cb1d76e4c89@linaro.org>
Date: Wed, 30 Apr 2025 11:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: amlogic: Rename Uptat to uptat to follow kernel
 coding style
To: Enrique <kike.correo99.f@gmail.com>
Cc: glaroque@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, linux-pm@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <Z-MEZNMLUmj75uxN@debian.debian> <aAImJGYXFDx_q8D_@mai.linaro.org>
 <CANfmkGDVks5tqgDw0ZvNMxT_vfD8rUKyZZJ4LUK6k637wt7=-A@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CANfmkGDVks5tqgDw0ZvNMxT_vfD8rUKyZZJ4LUK6k637wt7=-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_022606_874980_7ACC8B12 
X-CRM114-Status: GOOD (  11.88  )
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

T24gMjgvMDQvMjAyNSAyMDo0NywgRW5yaXF1ZSB3cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gVGhh
bmsgeW91IGZvciBhcHBseWluZyBteSBwYXRjaCEgSeKAmW0gdHJ5aW5nIHRvIHZlcmlmeSB3aGVy
ZSBpdCB3YXMgbWVyZ2VkLgo+IENvdWxkIHlvdSBjb25maXJtIGlmIGl04oCZcyBpbiB0aGUgYHN0
YWdpbmctdGVzdGluZ2AgYnJhbmNoIG9yIGFub3RoZXIgdHJlZT8KPiAKPiBDb21taXQgaGFzaDog
ODRmZTBjYzZmZGRiNmFmY2RjYTgzOGQ4MDc1NjA4MGY4NGNmOWVjZAoKaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGhlcm1hbC9saW51eC5naXQvY29tbWl0
Lz9oPXRoZXJtYWwvbGludXgtbmV4dCZpZD1iOGUwNWQ1ZGU5MzRjMDM3NTk0ZjRhZDM1NTBiODIy
OGRhMWI5YzJkCgo+IEJlc3QgcmVnYXJkcywKPiBFbnJpcXVlIFZhenF1ZXoKPiAKPiAKPiBFbCB2
aWUsIDE4IGFiciAyMDI1IGEgbGEocykgNDoxNeKAr2EubS4sIERhbmllbCBMZXpjYW5vIAo+IChk
YW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnIDxtYWlsdG86ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9y
Zz4pIGVzY3JpYmnDszoKPiAKPiAgICAgT24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMDE6MzA6NDRQ
TSAtMDYwMCwgRW5yaXF1ZSBJc2lkb3JvIFZhenF1ZXoKPiAgICAgUmFtb3Mgd3JvdGU6Cj4gICAg
ICA+IFRoZSB2YXJpYWJsZSBVcHRhdCB1c2VzIENhbWVsQ2FzZSwgd2hpY2ggdmlvbGF0ZXMgdGhl
IGtlcm5lbCdzIGNvZGluZwo+ICAgICAgPiBzdHlsZSB0aGF0IG1hbmRhdGVzIHNuYWtlX2Nhc2Ug
Zm9yIHZhcmlhYmxlIG5hbWVzLiBUaGlzIGlzIGEgcHVyZWx5Cj4gICAgICA+IGNvc21ldGljIGNo
YW5nZSB3aXRoIG5vIGZ1bmN0aW9uYWwgaW1wYWN0Lgo+ICAgICAgPgo+ICAgICAgPiBDb21waWxh
dGlvbiB0ZXN0ZWQgd2l0aDoKPiAgICAgID4gLSBjaGVja3BhdGNoLnBsIDxodHRwOi8vY2hlY2tw
YXRjaC5wbD4gLS1zdHJpY3QgcGFzc2VkIChubyBuZXcKPiAgICAgd2FybmluZ3MvZXJyb3JzKS4K
PiAgICAgID4KPiAgICAgID4gU2lnbmVkLW9mZi1ieTogRW5yaXF1ZSBJc2lkb3JvIFZhenF1ZXog
UmFtb3MKPiAgICAgPGtpa2UuY29ycmVvOTkuZkBnbWFpbC5jb20gPG1haWx0bzpraWtlLmNvcnJl
bzk5LmZAZ21haWwuY29tPj4KPiAgICAgID4gLS0tCj4gCj4gICAgIEFwcGxpZWQsIHRoYW5rcwo+
IAoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFj
ZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMh
L2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cv
PiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
