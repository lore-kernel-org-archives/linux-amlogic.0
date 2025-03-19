Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA6C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 22:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AafTxAF9wVbSmu6at7N91HRxGnnM5624dLeLimMcAi8=; b=ySnaaxnaLq2HcH
	Vf6UiP3ZrGKGCqagr9pGQ3bl/TknalNKcu1b4jhzTes0cLiiTQssC0uasXiWVExo1t182N2YldtJE
	wmwHB5XxaLdP150gtl0w5KwoZnlEfzaMLBBrWfiYVtI0u9dWQArnnULMf7A+lNUCP/g7IGuyfdj5x
	rdPEiw6udoisa1+1gQ/PVBhCzU7hYlKfdOvIoZ/1bM4mGeAM+FiZpUC+i1dBIJGH0LeJhbm8ii+f8
	2xCNP5zYfVfe5p2MWDrPvrUp0kaowvkrqVrAYC9YaPmUe/xF5sS0Mb6r6bDUZ0tNGt6pNJncBgqH5
	h2+1Ak5Van9r7KJeE+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv22i-0000000AJ2w-1smb;
	Wed, 19 Mar 2025 22:37:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv21S-0000000AIxO-0W3E;
	Wed, 19 Mar 2025 22:36:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-225e3002dffso938955ad.1;
        Wed, 19 Mar 2025 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742423785; x=1743028585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxV/xJXYWKCtENMVxUm3wS9i0eN0MZ3pOU2llzz4bL0=;
        b=gNcOHMBJh3oLrZwhkUsBrJhzd/S27Yfvpolz1dU18Wop1ojqjKK8cKw6MkI7Balb7F
         sGKea5UZfFUpYXoS6shHuOEGWUP9Hj9TpCR2lKivjBDNejuMhO0ac0Ehl84DgPJQOiRF
         knuLGdw0mmWi3HPC8fMxCVSsq6ki6KdjGQ7SeAgHdWN8mBVvDfadyT6vFoGrOIBOi69h
         hRfhRlNLlJw8N/EQem8qzdgOXKXWK8swffhmi3mK2tRH6ObpbUSJphu9ZKyH29Dg02RQ
         wjF8IHQZ1hgxfln3L4JM6qiIGX3gpQF90JV+VPo/oorsNCk77ngVoJZzZ7OqAORi2ukI
         5jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742423785; x=1743028585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxV/xJXYWKCtENMVxUm3wS9i0eN0MZ3pOU2llzz4bL0=;
        b=nvvXodIvYT1SJqxGgQCO/Z3NsSOTFwzmkmhRGVfVTWGpcZcuoBB0mXUk/VQdVHG0Td
         8tJedZtstgJPfXTA7GGvuQBFCFMKjMrbhN0taurNBnrxRCRmFeG/f83VHNqp3CcvdsEN
         yRGX0Qw2yV66aRWecQiuRqu+ajIvKnnDDbprobcxENkvZbzde/uTRHDHMqbCf5r3ajCV
         qYAxf/DzUVMSq1oqcg0xU8N2t+6Dv7vwu4njCsZI9pFk1SA1wCcw1W2en+ELPK+cv+sj
         xkxnEapOopKg3YNE/A8KOdAKu7CF8/ZGLA1DWtTCF+RLWeG6QhPZmFWPR5vMM74EeZf2
         Lu/g==
X-Forwarded-Encrypted: i=1; AJvYcCUC7M33nPuZAF0NSjib3Zve9AehblJw1CQCTLhVJvYAP2g0IHsSgettDTpAVlxIC+KJxNidsRqjfmhx8wKi@lists.infradead.org, AJvYcCVBxGyZ1QRVmsNii++XA/LqPolSHSvorFBA2eZ7rt6ZDSPHbVPZr2AcEEmkRtMb3vKo4X5tu26pIa7eUYE2Bex+CA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm2NGvdUS76ZdPttWM/MeKBINZuSaL7p2L2KMIjbAjDt7o2uYw
	OFmrzhuVQ2rMjeFSpoC4WSwS5T18/3wZdOmKEk39v8iztkwHm9UNmBJPV3xiPxoyhJwgQIeUc5R
	vJAhGkdPj+IAVG0TZP7cgC9bWzTU=
X-Gm-Gg: ASbGnct9Cm2S+aeYyiBYtGNHxzXuPIkE/AaOi5Jnm0VciXe9jC1T1pGnKf9csyWcbJP
	rAiNUOVh+0WjDz8lTRMwzcId0A/olQRYyg173TIb1dEaEY3QB14lGPSuM21dqX6NNia14sdWTWF
	M0NZZAj8rVt7/+w/ZH9rXiDJHUKdEQioSxI/yccn7FcuZ4d4HWpEay29c7Sk4=
X-Google-Smtp-Source: AGHT+IG/YIc6tBx54GZTNVesuUZ+0/SBrY5cBP76NGT3Y8BVMBK0uT7Wgcmqazmw2tp0JyM9BJP74tIXaQ45IJ2dJyM=
X-Received: by 2002:a17:902:ea07:b0:223:325c:89f6 with SMTP id
 d9443c01a7336-226497fffc5mr90923125ad.10.1742423785134; Wed, 19 Mar 2025
 15:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250319190150.31529-2-funderscore@postmarketos.org> <20250319190150.31529-4-funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-4-funderscore@postmarketos.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:36:14 +0100
X-Gm-Features: AQ5f1JpXkKwFQfXcHg1AOK80prLkwU3fTrKPn2VwdZF1QFdP8C6Judb0z-mEhaY
Message-ID: <CAFBinCArRO-F59tOv9m27f+DV+qhy69OGUunGOAbDdfOdd5_Xg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_153626_160562_349D9663 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>, Karl Chan <exxxxkc@getgoogleoff.me>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp0aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIGFuZCBzb3JyeSBmb3IgdGhlIGxh
dGUgcmVwbHkhCgpPbiBXZWQsIE1hciAxOSwgMjAyNSBhdCA4OjAy4oCvUE0gRmVyYXNzIEVsIEhh
ZmlkaQo8ZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZz4gd3JvdGU6ClsuLi5dCj4gKyAgICAg
ICBhdTI6IGFuYWxvZy1hbXBsaWZpZXIgewo+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
InNpbXBsZS1hdWRpby1hbXBsaWZpZXIiOwo+ICsgICAgICAgICAgICAgICBzb3VuZC1uYW1lLXBy
ZWZpeCA9ICJBVTIiOwo+ICsgICAgICAgICAgICAgICBWQ0Mtc3VwcGx5ID0gPCZ2Y2NfNXY+Owo+
ICsgICAgICAgICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JmdwaW8gR1BJT0hfNSBHUElPX0FDVElW
RV9ISUdIPjsKPiArICAgICAgIH07CkkgY291bGRuJ3QgZmluZCBhbnkgcGljdHVyZXMgb25saW5l
IHRoYXQgc2hvdyBhbiBhbmFsb2cgYXVkaW8gb3V0cHV0Cih0eXBpY2FsbHkgYSAzLjVtbSBzb2Nr
ZXQpLgpDYW4geW91IGNvbmZpcm0gdGhhdCB0aGlzIGlzIHJlYWxseSBwcmVzZW50PwoKWy4uLl0K
PiArICAgICAgIHNvdW5kIHsKPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LGd4LXNvdW5kLWNhcmQiOwo+ICsgICAgICAgICAgICAgICBtb2RlbCA9ICJYSUFPTUktQVFVQU1B
TiI7Cj4gKyAgICAgICAgICAgICAgIGF1ZGlvLWF1eC1kZXZzID0gPCZhdTI+Owo+ICsgICAgICAg
ICAgICAgICBhdWRpby13aWRnZXRzID0gIkxpbmUiLCAiTGluZW91dCI7Cj4gKyAgICAgICAgICAg
ICAgIGF1ZGlvLXJvdXRpbmcgPSAiQVUyIElOTCIsICJBQ09ERUMgTE9MTiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiQVUyIElOUiIsICJBQ09ERUMgTE9STiIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiTGluZW91dCIsICJBVTIgT1VUTCIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiTGluZW91dCIsICJBVTIgT1VUUiI7CklmIHRoZXJl
J3Mgbm8gYW5hbG9nIGF1ZGlvIGluL291dCB0aGVuIHRoaXMgc2VjdGlvbiBjYW4gYmUgY2xlYW5l
ZCB1cAphcyB3ZWxsIC0gdG9nZXRoZXIgd2l0aCB0aGUgcmVmZXJlbmNlcyB0byBhY29kZWMgaW4g
dGhlIGRhaS1saW5rcwpiZWxvdy4KClsuLi5dCj4gKy8qIFdpcmVsZXNzIFNESU8gTW9kdWxlIChB
bWxvZ2ljIFcxNTVTMSAvIFJlYWx0ZWsgUlRMODgyMUNTKSAqLwo+ICsmc2RfZW1tY19iIHsKcXVl
c3Rpb24gdG8gTmVpbDogc2luY2Ugd2Uga25vdyB0aGF0IHRoZXJlJ3MgdHdvIGJvYXJkIHZhcmlh
bnRzIG91dAp0aGVyZSAod2l0aCBkaWZmZXJlbnQgd2lmaSBjaGlwc2V0cykgLSBhcmUgZHQgb3Zl
cmxheXMgZG93biB0aGUgcm9hZAplbm91Z2ggKHRvIGVuYWJsZSBCbHVldG9vdGggLyB3aWZpIC0g
ZGVwZW5kaW5nIG9uIHRoZSBjaGlwc2V0IG9yIGJvYXJkCnJldmlzaW9uKSBvciBkbyB3ZSBuZWVk
IHRvIHNwbGl0IHRoZSB3aG9sZSAuZHRzPwoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
