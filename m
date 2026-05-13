Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548BDCD4F39
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6JkzcUKgch7h3Rfnvkkxg6wrvmxnaYhIyrt1Dr6eNA=; b=LI+Xt1cjehs4mz
	fEgynLZdaoslFOl6bxfH5Xn/N+V04QIdlJkeF+DFe4ao1x3MyFhBxZV8Q7z3kZyUb/isLdnDr9w59
	n0Ow+WbNoJRFVn0OoGOuZSLjN8t1eubHnkxnhuaHjG3VTTPYCDd5UVg1KF6mVnKB4vOv2RRsccS7Q
	3Osos/U6stMNcZ2M2KlH8wuVo/edhxtjfHFM5yMEeavcGUVYzUewXcpC9xpRadp78mo5I3ffqG06b
	TaoGJfbOxNOx03vlWyXTcuEIj9Hl9mnW0VCXcU8Xg/+Tc0UJyjSOvI4Ay11D6xski4EIdHpde645g
	1OKcVASi0QVz43odffoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pq-00000002VVi-3qlA;
	Wed, 13 May 2026 12:37:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8pm-00000002VSH-3aDI
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 12:37:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso60988665e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 13 May 2026 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675825; x=1779280625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wDZNYuJTOodTUWmKm8ygZ3ux+hmWufjjKn9F0AZmjY=;
        b=RcvHINsgrhupSUop7gI7qaYz2ji5j+yUTArEeuOTxpAoa0z3iUYOKaQE4Pw04ubpJY
         L1y/Tc9QeEUDj86y8YlkuuYnofChzvVrYvnvgoe5mW/mG2OAqZ1JsGH16OvlDujL4bp2
         TER+FuNXhZHNqvh08nfNeJWU1gG3rD5R3XaF5q0oehVz87cAjFdYIcwjiTt5OUMBdOAZ
         CMvMkc5ocSXXEqciitZN9gOak8WGgcEAo2F4f90MG3/7v/F7HKk3ehTnSfDqn0vsSWbz
         i9mlRXz8KSYJDZVXsnawjBUA0kSWu0t0PcfC0pQKBZ9ZRLcazhv3GYi3aSV74zLuIneK
         090w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675825; x=1779280625;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wDZNYuJTOodTUWmKm8ygZ3ux+hmWufjjKn9F0AZmjY=;
        b=nwsGbBl/GtK2YkJmiJmNopPA2R97qc75y/NciLL3j/0ui7ADkFTQvmagExgTe6k0AS
         NDwi8TBD1qAjZqxltQ9v41oO1fgnKkkgwYwG3EWMP3GHJuDQraMiysympj1Me3M/sO/e
         aUWcwmAsKKvo5EDbogmvh8Orm0qOS6C50/MDMJoMbpCGSb9Kyi+DpuyOtWijCfSoVLmh
         q5uc/CNIXa7r/U0wZeqM+LxZ+Ze0MbRAsVD2nAzDvlrBXqED3OtGowCfTv9kk9ve3HHF
         e9AqdiIJ8ekIj5ZNBtfpBkWJoSyyEEX+OLsG7YsefjjghKvCGPYTGPDeEYSt//HAP5v7
         1DuA==
X-Forwarded-Encrypted: i=1; AFNElJ+lG0g7ydtg4hv+BPF31E3cbFV+In0lX+1luFLcMe0PVj5AS5sqeAXI6+As065nzmB9456aJa6Vc4pjALxh@lists.infradead.org
X-Gm-Message-State: AOJu0YwiaB6TQkO7I6dniacgGeuNLghPC2IH79RQimooGMEGjRyem3BV
	Cj01sl3TyKv8vW06kG1WxLrnAe7b9bujHIB/rY7EPwMmMgqfQOxbAokgncyzvZ5tfKM=
X-Gm-Gg: Acq92OEb+M4mJyQoFW58UL7s47rrYzh1iqouEpV5kUb5xKBAs8ldGF5g3DUWvsYOgrZ
	rqhyH3XdWymX5s6962vZpM9kOwQ9AF1gRG2vGQ/lyVRLpMPbBETyCAe194q6R88MHpeXiIV5nS6
	AVDqIBA1jFIXU93n9f8Mx2eTBr1HJuP/nsKuzgjI2RJwsq8PewnrVnKL5F6LS9kTOjM7unkaKc5
	brQ8jrRR0lxWghu3lq8MbiFQjgpiipg1pPO3zUSWO5w87s0EEX1C5cVN90QGx4NrwaFhHey9PiF
	QKBlSX2IDjUEBSLkYzqLSda+HNKbPF6ItugWJw6cpH4lkrNjK+Pgl2USoObkcColkKlmQex3dTA
	ytK+iisMBkJccNIPdlq0KExgXiJ475nph5bUbbRiJnnGDa9GCJYBiBeU+xy6Uxx/XF4O1qjG5GJ
	wgVZ/dGUcJsYpTSt3UFHJ2GVU35JNPeK2G/AhGAadjgLch
X-Received: by 2002:a05:600c:a31b:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48fd5b4f6cbmr4318735e9.14.1778675825113;
        Wed, 13 May 2026 05:37:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
Subject: Re: (subset) [PATCH v2 0/3] Khadas VIM4 PWM status LED support
Message-Id: <177867582446.1433419.3719715146957232929.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:04 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_053706_913709_F8279D6F 
X-CRM114-Status: GOOD (  12.33  )
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

On Wed, 13 May 2026 12:43:52 +0200, Ronald Claveau wrote:
> This series adds support for the PWM-driven status LED on the Khadas
> VIM4 board (Amlogic T7).
> 
> The VIM4 exposes a heartbeat LED wired to the PWM_AO_C output, routed
> through pin group pwm_ao_c_d. Before wiring it up in the board DTS,
> the SoC pinmux definitions had to be corrected: the original
> pwm_ao_c node was conflating two distinct pin groups (pwm_ao_c_d and
> pwm_ao_c_e) into a single ambiguous entry.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root node
      https://git.kernel.org/amlogic/c/308e24fb9571be23aaee2e2a5de3da6f5cb3b029
[3/3] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
      https://git.kernel.org/amlogic/c/2bb37dc2976dc980a05ca93f529ff9977a24875d

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
