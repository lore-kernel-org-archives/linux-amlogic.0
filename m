Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C6FCA1015
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tNRHmPQjmcqwWbR3EHxqyvGsDRMPmGPTbn4F1IROf0=; b=pMK8AZUHgbtyg0
	KpX/LWl6nEAA8MJUPq4Q3SUIPgOI/l/RivlRfXap+FAeOgDLFv8k8y/h7aUp7v2HS/yaIoYISBgGa
	0ninvDUOK+m7g645B1OegeIxBz5InSE3y3q4eWJD0Y6Qi4iZ/Z8MBecpxjwavwdcOkmyWqgnPlze0
	AdKsjkA1Zx7L87aTVSNGzCxyOE+rSHFNxCpmTxKmegBz+Oq3nPtj5U7CpG2tWfvpMwOO/6+8trGxi
	zg9i15lq+FmZdhVMvV8zycHQI2xfETjq2/MGIJ+N4Nj6iKrp/9NVYsonwl6qQlTi5iu3Znl8NkSA6
	fYFT4fwHcwCKrxoWE/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCny-0000000CuiX-1ZdQ;
	Thu, 04 Sep 2025 16:27:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA0t-0000000BtHN-0xvA
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 13:28:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso8840865e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992510; x=1757597310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg9RQ81pLZ+ciihaHbHh+VHe51/1jd/flpRJCWP5vTY=;
        b=sm4tP6reqfYeqbefl7PVBbho9zDSmQKJNv9nLDS1Z8npFnnhne3Sdg2VRFlSQiwgxE
         ZThikM6Q5xmu27EI+GZQ2XhylUY8tEGTD/rQmvO9wlsiIGkNhEAAHq+il8Taw7jVRNIw
         G7YSkxvrueBoQnebJOZhoyZCmSslrkLPp8tPl5V3oIcBKpklLSaYw3tZln2vhj3lZCPy
         OLtpkHlO13fvT/JtkHUCVW3Rz4uSZAEh+gSL8CSdDRiccfm3OHni+Jio6R3HouTUkLS7
         5fr7Mis2Opbx/Rj3PhAhqF6Sj96kzvK6qDB2D62utHJAN79m/WfMrQnIEwboguLPFGBP
         KthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992510; x=1757597310;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg9RQ81pLZ+ciihaHbHh+VHe51/1jd/flpRJCWP5vTY=;
        b=f5ijEbb+l0BgnzB8H5DUE2O8Gvc/zJ93CKej1GD0nOkVfWShQmbA81qBlbF/E4hK1b
         Ihn/H50Sby5BN1ovx78MwsDmyIaLdRGy4/bU042DR9kgbob2GntHTcdEo2G20bT8Ff86
         5gDLvQgCkACH5RQOBM5HW/sznoY+UsaY0BOoDV/InRcEx3llHAuRhNNHfIC2cyroMYDp
         lsbx/7qPQUVgwgVkbng2lI0Vg6XYnMX7XM0nW0BW+P3x7YR9e6nWTgpJdkYasFggfiVv
         gamJTOzVwGJCMaCQEfzM7TRHJUYcpbZZvMazGSIG+rISfAL1QLZ4FiOssg/i5OfbJm2Y
         QFIw==
X-Gm-Message-State: AOJu0Yw6ep5kWbVfgLBV4JVP3SmAGqPBK6OgzmQXBr5wuf8THFzOOqJl
	onHQRlUt0KMx7MC4nDr4e4BD+EPsHDa6l/3EE/O3rlpYsDrjZ0CIQm4ZcgplzEVg7yDGmDQYNGk
	1sMfkZ1sy3Q==
X-Gm-Gg: ASbGncvUaEbao21DioLh/LTxA2B5kyaCWZhVGhe/rTGWw5RrYEKnwrpFTBv7dMOeoKD
	5/p9fSYltBlJiAS3nRzbKayMMzgKcxjLPqn23qc1wJ8HoVf5Z0j+NYWLnCn/PuvMZEWx5NctsdM
	DDgiNj+ElfYvoOYA8b5VqisFG0K7iE9dt6iOCyW+XDAsC3fjs1arYjPWSwePWIfKRJ8+QsKDUJp
	EQsreXeoWMu5cyRItFmbpCOaZeEKPfbdAV5ahwbysexvudJv0BDVkLUJHIQzyazSC3vhRcK5zK5
	xqaULdBIHuPjnlPdAllBG8d9rVjlCqEY8RSzzBa8up5BtT/iBxSbdVxcd6qj9GXMFz2uss5mES+
	yrYEfBQxmCCkMV7tKqNVChAwUp5rVoHdeAboF5Rs9nOc=
X-Google-Smtp-Source: AGHT+IEqR0+n4/kIxFH+iZ1e8ctE7JnfjyeZG2z9hWnY3yB50qjsaKmYnmnDkhp/9C/R0KCDPHIUFw==
X-Received: by 2002:a05:600c:331b:b0:45c:b501:795c with SMTP id 5b1f17b1804b1-45cb50179cemr38578945e9.10.1756992509525;
        Thu, 04 Sep 2025 06:28:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm286165305e9.12.2025.09.04.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:28:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
Subject: Re: (subset) [PATCH 0/2] rtc: add amlogic C3 RTC node
Message-Id: <175699250880.3374853.13696019102809895067.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:28:28 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062831_273259_5432DB65 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 17 Jul 2025 17:38:36 +0800, Xianwei Zhao wrote:
> Add C3 rtc compatible string and device node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[2/2] arm64: dts: amlogic: C3: Add RTC controller node
      https://git.kernel.org/amlogic/c/59b4c260582a74e641c973d016725e5dca32f300

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
