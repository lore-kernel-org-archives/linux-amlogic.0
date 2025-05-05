Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB6C3ABB0
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCrFYxNkjt5X6M/A82zbrWp1ksbNueg0JsThfUOCCpM=; b=dYAL1u29p3E14e
	6bObXHjLaZmxy0abx3Kf1q9oTPwRBa4hjdtw82lwupOBYRbVjC2roAeg4YkVMtj6Z5PEizkZ8X4DM
	JZ//w18sQGDRtgmiNI6MHekg7vz2agvaXHOYS5fj1WBEdfmYPUmj5RX9iwIqN2H3+wUlaIyrpK2zY
	ZyzB+/96pW17gOloU5DaFfBceJeWsUoAHJXxqR91J/BO/GG94931XudFkCtMlFk/H4vdvMYH+Oj1i
	8o6idKLWFhntNLXTf1+KSf5eca3400Bh6uFgwAXwJRmBQozCnF+8xGFnYpN/yc2pGmlRqJt8l+5X+
	f6E3ehCcRn4s9DG8gY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvFN-00000007O7j-2hwA;
	Mon, 05 May 2025 12:48:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv3n-00000007L3b-0MJT
	for linux-amlogic@lists.infradead.org;
	Mon, 05 May 2025 12:36:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso19185545e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 05 May 2025 05:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448597; x=1747053397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJalLmswOZQ1+I3caNB5vdR1vqtjSyhFatNldwOqsTo=;
        b=dOhvziZKRl2qiLMpQPpk8D5/EZRwi4VVhiUidqhtxAph2d5Mv3e8Mt1V+FFPuJ89MQ
         S5m5oJ16AbKWSRW4Cz/9t7bskHf4guOhszxTQapzDG2ac/vZutjz2pQzAz11U5ULHWlC
         3D3gqQK6sgVdZGlPulTSwDQKcGk90YlUHMzvU4yAm39skcJWT+a6GBt9aj5HQb704g60
         YGwVGODl2bHBIdi5zyfs2UycHt24IXv8D1NwN8wbFkqJSrhHoRopihC6M4bI2LgQs1qd
         KLA9d+S6SrDIeL+BL0lA7MeWJnNBg0OcXFgloJNKjbEHNTANniYB7ubnKZmUIc14qE3G
         MJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448597; x=1747053397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJalLmswOZQ1+I3caNB5vdR1vqtjSyhFatNldwOqsTo=;
        b=EgNsBugslB+YbHDjHx7TaDero/vMwQMzsow6y6EmRql77UWC5lI+rOIUrcrEFjk21q
         Yf4P6vQYC12Uu/2Gx5jV3Ig/CAuOd4Gc7ESdeBluo9ZQjlD13ea+SuSoq0/7BBuhFQq8
         kCflgjAa3a2wmaOn+6sOzGuC6OKObcEdjLbf29B71r8gy36qyZ1eYq8smbju9H3A52Ej
         x2aCtNO9a4KXHoFww7lvulsAKKK+N1je+PV5GXZecd5r9+0QnnXQ+6tBABdKNHB8gIHv
         7CG7O06DrI+9J51Aumy1wxrM6MDAEsOgoTxcjrjHx3QT/4LnK1lXOPxu4HRtGtUR7Khn
         EQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDfixPHDOsDQtq8vqDP6ofiu0d79kJopiq8Uv833S9wWWRH1d4AgSACzPYaoAw3Q9DmMVdfq1ieFLu78A0@lists.infradead.org
X-Gm-Message-State: AOJu0YyC5wlaoc5G5MjX8ThIrUPOgk1s5PTnqIH8uGY5IPysvQJROKA3
	Fx64nKfgE25NcOkPSUQRJt/xDsU7vWzHMRsQzpzsW5hMvDLONKgXc0Xm6I/qbglYXdXa6UqkKV8
	p
X-Gm-Gg: ASbGncsnyd2Gom9l9+vSh+T4NNoyhAIpQoeu+7cIPlhUdPgzgJb9vWIcZoxvYdw8zLE
	k7CJp1SIJ4T5fCc7aFW2T6+GAh5qCzi9Bck97SGJbRHEG54WcaRjZnZ1BYEGVlgMqBMfLK/oErU
	OIr/X54Hr2LQRuGWRPIngjlod+mDjhqwYah+88gmdMXd6MsHtdolB1WcQgQNzCztkVSR/NyD8Zn
	t70jfQMp9Ag/1qYvom7/KZmBRssKwl8mRvKZIj3A0I2ot6S2fokiGzrNiv8cl2nEvdupnhg0RrR
	2dusPcmjdz58o7VTzVHvHZzmZm7sllb2+w9CJflZ12gCDa0FwSpSl9D3aZBEU3imUs4q+vaL
X-Google-Smtp-Source: AGHT+IGrYbfIV/5LAwd8x3Ag4BU1h2NQrpJczDWD3n86c2dPS4oVyLjVkTxVfPE08xsZ/bSn/VTNWw==
X-Received: by 2002:a05:600c:3545:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-441c47d3cbamr52857685e9.0.1746448597366;
        Mon, 05 May 2025 05:36:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286c4sm131072725e9.25.2025.05.05.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
References: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
Subject: Re: [PATCH v6 0/2] Add support for Xiaomi Mi TV Stick
Message-Id: <174644859616.1377721.12603834364011282059.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053639_117528_6D05CBA8 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, 02 May 2025 18:56:04 +0000, Ferass El Hafidi wrote:
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
> 
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Wi-Fi + Bluetooth
>  * Android TV 9, upgradable to Android TV 10
>  * Google-certified
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
      https://git.kernel.org/amlogic/c/4954ec9300cfe7ab6f1de1c93c56c236ac0a07e5
[2/2] arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
      https://git.kernel.org/amlogic/c/f5d4227c6dcab047579cca7b8e31a476ecdebf7b

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
