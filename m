Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40953CCD1AB
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Oct 2025 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnZ3oxBmFm+vWt35N7k+CdPqY10XmuYlz2rxIHKrRqo=; b=H669pc1chb4u8O
	KuJebQH6dIl8Z3bgUTva+V6SX/efrod1KA+atotcCzvNh1WnmimhKLFx2nStdeG6UqKzGPWHOZLRp
	wadJ/uOMA4Ps/bZfcSmUj6qweutEn3xPgnKIIpUBmtDFjYDZ6Cre1JQw1lDLZPBxBYr9ImgIbDFZd
	TtgU6uDomgoxLd7sV2XJuTBWeztAE+tp5tRE4nyZ1J+TUAot3eOpEpgJY3D9f9Cv++HpkMwTyuw+7
	2OW0+8rAaqQWNzyBeSh3Nm/oae8TS7RKqR2l3NehUNowSDmNgtubtGU4xrCgk1PNT0Pd5xEp5uknA
	KGmiQKgdDrYBhPJRgdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUt-0000000GyZH-3OHv;
	Tue, 21 Oct 2025 12:29:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUp-0000000GyV6-3BMZ
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Oct 2025 12:29:49 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so1069833f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Oct 2025 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049786; x=1761654586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfSnV9t1F/SDBYI2zrfencQ/tnUy59bzGcgByOeP5HQ=;
        b=M2nGLDCzMa++hC58L1x6XB4m6E+23y9ZGmdy37YHpWsTJqskCwT4jQ05cq1dYkNcuG
         pXpZ+I6oLYkqwxCAjw4Z0Jqh/eIkub5QBjQBiG2TWqREAvHHCoqK3sM1IcDsjry0u5/8
         2qiyGXhlK8joEbXza7tySTDnr4BHq+96L112Dmy6Wf1U+hVgtqSJwPgw7A2phXzwRkqz
         OjIPTZNLtYJV2209r6U+zZK6m2NaZMX9p7/ruRvoYNIFS3+HQLAQX7wvcld3kXE07y1S
         wotYzOAd3A/eUp47hQ9DNjcpVI2o77p5YD+ZnXG5wibV7vvy8miRB98U2MmL1Gert5Zx
         ogaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049786; x=1761654586;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfSnV9t1F/SDBYI2zrfencQ/tnUy59bzGcgByOeP5HQ=;
        b=jE12WbYZ7yTC8+UC5QSarPFt3rXbwljOirDvdQWT4ezleJD2oN4RIxm5G/f8vlYzjj
         PQXQzJpywf9mbMb6q9CK4cdkrV21QNvN/+dhZSD8154UWUtCUmDlEx4mCMiMTZyOJovv
         7xyYP5svB9/YEPBFavmO10Vf8qIvgp7X9dxkGADvmOPNx23J0yjCE14a4G/zwwDecVZw
         os4vauxntZ68mzv79GMcp90M2wkR5fi8of/Fh2v8u4SAqrJ7Wd45oLUgStBlT7SMaTM8
         vFwZVoBrTFtpk1WWYuDvO+0rQ7PBGeNwcZv+6azXD+eMXBPBwSMyBk+ircjKCdtXcsDZ
         EYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw1eoqttVkZj5HJnm0XikNWCVCEHAl6OkglyebI/rv9HQpUv6gzdEVEabHNRzDQJTjfcTLdNsUgbaAml79@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8bs6Mosk+K5j34v5hApIamntiv6z3U4Q4WXblwQWV7xJAP63J
	SiUbfwKPbSc4hiBG9EAE78Y1kh1cLBhrMAExS/sHDEKeffGSQJOVHM/f2hw7hyJs4Gs=
X-Gm-Gg: ASbGncuZZE5T+b7ksKCbaHPwjW3lKi/XVGL/gnYZGx4RhGSlBScr45IOYiiqnXQV0zi
	edMIKmlC5lsOtJM8Xn0fKae0lR8XRzncGAoKCnwqjqiLl5ntdGLppTt+M0ISapZIk0EfHDGb/qQ
	gOpAFPgZMn37uy8zIY/LNOh9856GKzx9wqYdqeU2SuyA150b3M0tLIedhqCQAPfTKttWdIxyZ4v
	R2DgbwLtBcF4PHZsPWYWqoJf29Wa8i1FxjixTgzKVmGWjgtLWc+ocUZgqsf/Miige2FbQFihbqj
	6pyqGnHko4YAnJYVQvMf9TXAyP42CHn3iOF3WWILK0WVDSKcZuBTiwkiHTptNNoj4v8j1zInX3Q
	pVwxBXa36nd08iyacGoDFV1tIxATgwSvv0DN0smQyqFoOpruaL0SB/0LM2KeEotqOV3MoHwpHRM
	c5n63aVpViKYkR+fOoiQLSqHNtO1S6Qkc=
X-Google-Smtp-Source: AGHT+IEpSASoRALREWuHJtczt+cRiPjUi8QW3wo+6igdJHTvMSXLltYmWA/nv4zRiVtwUcuiVTG1NQ==
X-Received: by 2002:a05:6000:4382:b0:427:a6a:fd44 with SMTP id ffacd0b85a97d-4270a6b0aa2mr10341671f8f.61.1761049785881;
        Tue, 21 Oct 2025 05:29:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm20057043f8f.17.2025.10.21.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:29:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keke Li <keke.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250918-b4-c3isp-v1-1-5f48db6516c9@amlogic.com>
References: <20250918-b4-c3isp-v1-1-5f48db6516c9@amlogic.com>
Subject: Re: [PATCH RESEND] dts: arm64: amlogic: Add ISP related nodes for
 C3
Message-Id: <176104978523.3075289.16180550527361572624.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 14:29:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052947_827522_0CEFD600 
X-CRM114-Status: UNSURE (   9.96  )
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

On Thu, 18 Sep 2025 16:35:09 +0800, Keke Li wrote:
> Add the IMX290 sensor node description to the device tree file,
> which will be controlled via I2C bus with image data transmission
> through MIPI CSI-2 interface.
> 
> Add CSI-2, adapter and ISP nodes for C3 family.
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/1] dts: arm64: amlogic: Add ISP related nodes for C3
      https://git.kernel.org/amlogic/c/63aa70a1f84f5dfabbac28d60e12949705876648

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
