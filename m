Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F87C106F309
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgshKwiIBtbHh3XEoFiV5bZG3UlmAkSH0kk5EUV3h18=; b=NMLFsckHuOeojY
	JuRy0+Iay7Yzb1XBOzmnAvFt50LmaBZQTpnU0cMMo40QoTLsbp04ALRajNFjs8xA9w3bGMul4Gc+d
	UIPEejUjVW43pi4K1IB1qFCRdDTOHpnLDoRvU0s0Mepvou6zE7ZR3gHoeSA8tXrxWHa7F9JIPXTvf
	bnhQkmtiHihlQFy78ivamkm/Z9otnN/4ZYQkIk4Bt23W/MDFOI3fOlqLqzbrdpEjaY7z5W2qqD2i1
	OyP26h2a1fsYZ1DgyO4qEXuWatzJQVw7diB8lm8eZq+by83/Zn/VqzNxOAtJO1v9so7ZOgapU/cye
	qslQehvp2/zIEdPQtqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ggF-000000056Rg-1VuH;
	Thu, 26 Mar 2026 09:07:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfq-000000056G0-3SZv
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y3TlfPr5wsxYEJUguikxW+ieUfgR9C+ry1PS4rSilIM=; b=CLRNvwJWjJGRxoOpoK6CG6s7NP
	u/vJR5QJyhtijlnslIhULN7eCFi0sEIcWuJmPKsVvOBveeah8UzdiicaXs+K0E9WKHL33HeT63jRR
	I0DG9ukDft7DPBPVT0BFnqANqeZeBHxPUjVFaYQnSDTElWP5NqGXQPTUuBww5DcSlKGVe3VpZ8Jw+
	C1teLtuitz6iSGrmBK5Q7G67JnAyfV1+EcFtbdC8nWX1uJu/zmzL8KpXGiKcz/02F99r9AQbs4MEZ
	XYQv7yprKOQiX0StOmlGQEvez+HOS0oJGTORX6jYGchLqyS8PXtCcP3pIQw6pY2tnBxp3QnyAKWWp
	ivDVnmJg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfm-00000007pvk-2Vrk
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so6635165e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515997; x=1775120797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3TlfPr5wsxYEJUguikxW+ieUfgR9C+ry1PS4rSilIM=;
        b=eODtV72B/9uGiEdQyCiD6rSAUxuG9iaJUUhtLnk3xwgFbHK8to03FntaKEw3Bk5zVi
         CCyx6FJDsAcHJGqKY18yLdp42rNKDtq9RIFDDilFBHNazc/U8SWJLZHtVlMf9Kb5TjCw
         wDxUgsOfV7j4NDbUrLrSsLeRd1z0lB84uPWFxRKs63hJwD2fkI/6IrkfFTnINYsIIUea
         DJqdAX63EJLXXkLDwiOZvoR3PoKQ5MCbJ4OCnPTLDpoWLqicq2qFf0PRZijcHvFXwd21
         QAbyl2OPuYT7qTaRKQJf4Hq2JsZ2VQeZCxb4FRy832AN2MORcKMuM+lt20f275uLbcax
         kaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515997; x=1775120797;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3TlfPr5wsxYEJUguikxW+ieUfgR9C+ry1PS4rSilIM=;
        b=mBKbQM3BxmWpgkouKsAR9slKHnegwQeEShZttI60NqSpJUPWGnKJq66f03PS1NCuN3
         dBaQbKhH3vaDbCwPEkfRcTLkVkESQw9Zgau7ShHXdeH/bVvuuBCYwrHpuXeekNdTtKXI
         ZG3qLo5Eh41aSmLSdx2MhD6rylTWE2tvWOJsFKXgclcUYkOpAQP3qz73GAqOXZrTmWHf
         CakWw9yV/dsePhw4ZXAOl+OLhp1mVwqqSTyLibaP+iHRPBc1EaEyn7fQu2Q7d93IiZ1f
         6KZMdTvF9X5n/uhqK6PAOUimJUOZZc5yv1NOhtdJFOL19lTg5V399OYLqqDUOaFgSSB8
         1Z7A==
X-Forwarded-Encrypted: i=1; AJvYcCWs/binG/50fmWq8SbvMKPJQNT7OEJzL5gEkVBfcZNIQyL+vmsU/R43rlbpAkSPIUZw4hCVYk7kNDMSks0X@lists.infradead.org
X-Gm-Message-State: AOJu0YwGhbjktjFHiFsKT50iUYzTjAaX1iH/q1CQcC/Rko6j6f91RgI3
	VOHfOi7rVfg3AOV/GSUqSVFcWo7rrUBaoxhj/B6fOTE4KnP8J6dFVUaLvd4nahInerY=
X-Gm-Gg: ATEYQzx21q5Yr4JyezVSZfAQ0gQbv+BE7B6TVxd5KiF41agdcEMg3FGoJgzPMYmSfIv
	woor70z96Sf5RIdmTdL/f9HfJ2hm6xCpj3WoES3SE+1oWWMkwSFi+kDTpIadI0dDIDzYRPq1vyl
	HCh/ypAI7FFWEK+yqiqXOFdkzqFnhlZovl5P1W1zfLoO6nRGPLDIrGG1tZTM0MP7PzmXARdBbIa
	wCw/jGxD6SvwWeZNRaujlrAO0ZG6xPVJPDqTZUqCQdKtKe+5vCSqwWFPBcDKzXyw1NhXfm30KuT
	G8uCKL/ZFKYd+98B5+UuK6rFyGOXDk5XB/NfiyDMxjzFD2TqhIYN0ct9uJFxLPjv0EQXxq6YeS+
	ujsJCN/q4cJAnFDYFUywxjPwvLRSF1tYAW/7jJIxvXe5k7hfAPHt/WatXLoGgDVR9lY2TIqIA0+
	2WrgxgU2dXT7UPpdmw79qsLkzfUT4wr6MkkToCxUuU+4xb
X-Received: by 2002:a05:600c:46c8:b0:485:3d3e:167b with SMTP id 5b1f17b1804b1-48715fc33bcmr99989815e9.5.1774515996854;
        Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, krzk+dt@kernel.org, Nick Xie <nick@khadas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260228063750.701887-1-nick@khadas.com>
References: <20260228063750.701887-1-nick@khadas.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: amlogic: meson-s4-khadas-vim1s:
 enable LEDs, Keys and Bluetooth
Message-Id: <177451599604.122020.4295187646181046048.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:36 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090638_780168_89435FA6 
X-CRM114-Status: GOOD (  14.40  )
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

On Sat, 28 Feb 2026 14:37:46 +0800, Nick Xie wrote:
> This series enables various user interfaces and the Bluetooth module
> for the Khadas VIM1S board (Amlogic S905Y4).
> 
> This builds upon the existing board support to fully enable the
> user-facing peripherals.
> 
> Changes in v2:
> - Dropped the SARADC and Function Key patches from this series. As
>   suggested by Martin Blumenstingl, a dedicated compatible string and
>   driver update for the S4 SARADC will be submitted in a separate series
>   to ensure forward compatibility.
> - Patch 1: Split the UART_A pinctrl definitions in meson-s4.dtsi into
>   separate rx/tx and rts/cts groups to keep the SoC dtsi generic
>   (Martin Blumenstingl).
> - Patch 2: Assigned the UART_A pinctrl groups directly in the board dts.
> - Added Martin's 'Reviewed-by' tags to Patches 2, 3, and 4.
> - Link to v1: https://lore.kernel.org/linux-amlogic/20260123022258.136448-1-nick@khadas.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/4] arm64: dts: amlogic: meson-s4: add UART_A node
      https://git.kernel.org/amlogic/c/6710d76d7e51a24f978eb1ae0738d1e3c25e034c
[2/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
      https://git.kernel.org/amlogic/c/ad44c753b976e469f0f014b6f92e7180b6a7ba59
[3/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
      https://git.kernel.org/amlogic/c/b8a95d4c054d9d2e784ce5eeb6a08be0ce9031d0
[4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key support
      https://git.kernel.org/amlogic/c/31132e11e9dd97c706434e4f9e86b503c67a6bac

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
