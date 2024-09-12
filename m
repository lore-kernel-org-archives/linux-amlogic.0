Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6BBEEB57B
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2024 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRxFvnj7sYkjNfmmGGcenDMgghTOiTNSibZrIm7+rps=; b=wp9IG5Tq/3v16b
	PsZDiHcUg2pwH6qPpsdkcJpbKYXBu4otIZLWJYnfyxnPK3OhigieSPX91RJSh71A+kt2Rmb9pyNR8
	ZDD15VVWfgc467Y7+rRApfr6mWYm2Nr4Y8atHMqFxPLVXS3m3kjAAD/dRjokj5BKEDnFpsK3fK9ls
	XrsGUUiv9miDtZdE+Qbp2Wt/c3wZ96RtoFGb7dX3pM0GiYw6fa6k3UCRFnN+IfSck5wF/HmOPAyX0
	E95DWERT7fnEg21RAs8VTBVWZkCq47yR5GEgDdcsopLylre5Uc4DicXBNbVHoVsWJ6ifRLefzC6gk
	QWTUj11j8wGmkZ2NOXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogAg-0000000CXQL-0jKq;
	Thu, 12 Sep 2024 09:31:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sog8U-0000000CWpD-1kZZ
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Sep 2024 09:29:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso7857425e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2024 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726133348; x=1726738148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wp9jPxe8dbEyJ5HtUVcWqEzQO64+7gaLQ5RI1SB1IH0=;
        b=lDHrBPYYPIxXC4FPDXRpxjSNVKhRBilSGGTdXhI/HqODcsolq7vWBZT3qiXWNz2sDT
         XT5aImZflpzMpDK08EYvimus2CuY1zY4c8OF6hH2OSU62/AnuWQ5LuiWqTD9SDqDBeNw
         Jd0bb+5hUTW3pjZLf6Y7zG4NWeejwgB6w9lPEsz5zGjuVfu2szG4hmTAnioh+0Dz/rcj
         51xnWfa4QSVGo8dTvCs26t1+5S3rm+W0B4Prk5rLBtOQjKCq+l8T/h3OlmAflLb6ETZX
         /DshTZcnT8UDTbj58Gq81oOof4jyrGJiXFOHheX3ii6G+MRyO+TcU0u1RuVHZKgjikgL
         kpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133348; x=1726738148;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wp9jPxe8dbEyJ5HtUVcWqEzQO64+7gaLQ5RI1SB1IH0=;
        b=Be7AvLca/0LjgG01fEvXtUVDVsbdcHVOmCzgz7ZSoZqFk8ILaDsYqeK9L2Vw7aXgXY
         iV+H1qL7Q7muMq1l4ywPQtY/NFmGNMoLg8brrLOESNol1jMK+7VMXHpfe+0HtO+5gcfj
         wQ+tTVwJkDVS9+J//CgLuQRoJTuf61N5/f4LlnFTbok2qYpElBxHsWdbJ84OmrJfP7DH
         IBM4aiyx0hLNyFDlSr2AWiToUp72Gdwi8Sij9NFU6xFNmAyybVQ5PFydprutxDNXrx5L
         OPmm/TvFo84n9pGJuOiC4cQBbZISxZHN65+d8XbRV7DCJ4Fa1Z/xLBMOtJ/78+qeaVF9
         CMOg==
X-Forwarded-Encrypted: i=1; AJvYcCXo2f15Kbtd+EV9md/D5tbt16qfEtoHZNv+FVy9JmAN6WLXG6s30XbyEDsn29EX2/gwu02jdbc1wJayzD9n@lists.infradead.org
X-Gm-Message-State: AOJu0YyBpOH4+TQV0++PA2Ywa73sHaOpE5IVXcwKBkRw8a3NwQoIrX2q
	5srLMLdh2n6npurNIncEs52DVUlcFaiuo7spZ1xE45O5KjP2JLcj/d44zR2qhuQ=
X-Google-Smtp-Source: AGHT+IEgyiSK927zXIsO2K8ws+WuFo5rdGvLrwD1Uebv/Pcw7+ODrUZYJsEs7zuDgKzW3jgL4jxagg==
X-Received: by 2002:a5d:4945:0:b0:374:c160:269e with SMTP id ffacd0b85a97d-378c2cf5617mr1780563f8f.22.1726133347751;
        Thu, 12 Sep 2024 02:29:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956652ddsm13911677f8f.29.2024.09.12.02.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:29:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, hkallweit1@gmail.com, 
 George Stark <gnstark@salutedevices.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@salutedevices.com
In-Reply-To: <20240710234116.2370655-1-gnstark@salutedevices.com>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
Subject: Re: (subset) [PATCH v4 0/3] pwm: meson: add pwm support for A1
Message-Id: <172613334685.3721802.3816923810532224075.b4-ty@linaro.org>
Date: Thu, 12 Sep 2024 11:29:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_022910_542147_B660B0FD 
X-CRM114-Status: GOOD (  12.43  )
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

On Thu, 11 Jul 2024 02:41:13 +0300, George Stark wrote:
> Add support for Amlogic meson A1 SoC family PWM
> 
> Changes in v2:
>   add patch with optional power-domains to pwm bindings;
>   fix syntax in a1 bindigns patch:
>   - use enum over const for amlogic,meson-a1-pwm beacuse adding more devices here
>     are expected
>   - leave only base compatible amlogic,meson-s4-pwm in check section
>   dt_binding_check and dtbs_check run ok now;
>   previous version: [1]
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.13/arm64-dt)

[3/3] arm64: dts: meson: a1: add definitions for meson PWM
      https://git.kernel.org/amlogic/c/b7e5f4bb555ba1d4fdad6f94eb6ab9f8d9c63597

These changes has been applied on the intermediate git tree [1].

The v6.13/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
