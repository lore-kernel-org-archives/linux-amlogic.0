Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2795EC10F05
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Dec 2023 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6VPIBJTH/FiZL0Ncv0xxKafJAWJm6DjknNtxQuZp7U=; b=EY6VvayArtz808
	MBClASgx6Hzi3+pszS9hThjMH3RdQudLYVR0aooCSzDnNy/MH31APbAnr0K3g9Eq2DK/Hz5EHLaXe
	D4MAH3YEh8kd23DOA0VhgNvw+jh1x10agFnuAD6KNNepYR1LHqaVKoKWZnxBrNP698T0dyxazGI/8
	J4FiBlG/8SwsOIkdz8AC62GIbOHfJlAEysTwGeXzZbaRwogoASA5QaUc1Q1mkvBEP28n5BuGattXb
	UvOf41zMNoBZqKB680xnn0kDxdAyEy+JdpL+KLLg2tQwXceU2V1NBE3Uhdipo5NBemSoqNJSJO0WJ
	43dyWsInPZOQ2u9pU6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcci-00FsAi-1C;
	Fri, 08 Dec 2023 15:18:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcce-00Fs8w-2s
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Dec 2023 15:18:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so2106378f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Dec 2023 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702048715; x=1702653515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDJhAtFw7QNuGAGl9H/scPLTNO01fU317zwwAd+ymrw=;
        b=M4v5xmWfdhmhQNSq36KpdmWejyIGmTX07iMiROxVq9n4iZUaT3oFSJfjwgSQhwZXvC
         Aa/DDSaomAfHr0JwQZFwhwfZPTCQNKRBhtvoJpm44JxPhyojGP1fEj5Y8ETwK7ixj+q2
         SANWUCSsnnKcmwmfkH7VoW6fOIZA4lzig7O7EAIJzOqmsJ6EJtGKdgeBDtJSoRaAgEEV
         xKGhpixoW/K/KipTLu95yUy0TcprwAnY8K95rhU77w3lpgCHoYPfjY/rgUfvzRhYUQk+
         Dr79oiH7SduPStfLG3qFot3rTFGtN1lPb4QMjZbBWW64e1YThzcHKL898bmJqF0UeuLk
         ejCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048715; x=1702653515;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDJhAtFw7QNuGAGl9H/scPLTNO01fU317zwwAd+ymrw=;
        b=j7FF0jWrM06n8O54v93AyA9Ngz30Hm0pG6el6avXQgg26XnhF/Gchf6ZESEz/cYVuq
         jzAW8SzohSS/uPBgvzH2RqDvq31FnStNPbLdyvyAGBgclpVGHi+YjNjyLHo6iNBHRWks
         9wpIDfk+D+BBhcIWMOBHSaPsqLswqsdfkvPHR5HoyMgbqmQ68WQ1JEh2TMruhObB7ir+
         Fg0TXOOiCD3jcx4TrYK7Bys0lDaH5MuIdNjGctezDpTFCz+dxhKJkROzYltQME0AapE9
         C9IbEcfm/Tg9eQkP5dbWNOWImZBcH8evMBhpwkTWCPjgJLrH5eLSDJArF9l+uVVwSyua
         jRqQ==
X-Gm-Message-State: AOJu0YxUBq7p1uof+lhBSme83iWLpN8Ugl5nBmMULXU8tDzoV/r/FZpe
	7EZWzKraYfYIGsktoTXWlDlYBw==
X-Google-Smtp-Source: AGHT+IHVtfBSS4vVLH0cQZZ6RumcjOm6eQYQHcCnYJmcBF3hWLk80BVJqfp3DxIT5UGF1ixTnh6a3A==
X-Received: by 2002:a5d:53c7:0:b0:32d:87c8:b548 with SMTP id a7-20020a5d53c7000000b0032d87c8b548mr111329wrw.21.1702048714704;
        Fri, 08 Dec 2023 07:18:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d6806000000b00336103442d2sm825119wru.76.2023.12.08.07.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:18:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231208-s4-dts-v2-0-5a93fa356c5d@amlogic.com>
References: <20231208-s4-dts-v2-0-5a93fa356c5d@amlogic.com>
Subject: Re: [PATCH v2 0/2] Add some devices nodes for S4.
Message-Id: <170204871348.55256.16571594130908656997.b4-ty@linaro.org>
Date: Fri, 08 Dec 2023 16:18:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_071836_928338_B41A97E0 
X-CRM114-Status: GOOD (  12.08  )
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

On Fri, 08 Dec 2023 15:16:25 +0800, Xianwei Zhao wrote:
> Add some device nodes for SoC S4, including periphs clock controller
> node, PLL clock controller node, I2C nodes, SPICC node, NAND
> controller node, Ethernet MAC and PHY node.
> 
> Add reserved memory for board AQ222 which is used by ATF.
> Enable NAND, SPICC nodes for board AQ222.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[1/2] arm64: dts: amlogic: add some device nodes for S4
      https://git.kernel.org/amlogic/c/528016cd2b52001564792c4a68483d44a6fbedad
[2/2] arm64: dts: amlogic: enable some nodes for board AQ222
      https://git.kernel.org/amlogic/c/66fdf773ccffcb5b6673f0a5b6693739e33b5181

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
