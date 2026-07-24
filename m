Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7CFC531FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2026 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nvk2jQD/DRtn18z8va+Uw/y8EVdJa6CaBBriGi8ZhkY=; b=voITNDyLTnGxR2
	Nb3gM4mPIL6nnv63J08WOIjstRfnrpklF+MVb0dc8NpQ6aW4ljAx0GsBjScE6QsLnrFcxst6HtXOv
	N7HFczm7p6iGAT5Ji2GCNBbARUb6aZyMoFHgBzk40nJ8ef0jatV7ht5Fn9/2Fpyr1KwZZtqH7Wg9W
	tgo9ZAispvEKd8DpNw0volu11BhNxgE2IvFH64Cm5EEdD4M0rW3kh1GoGOPQM/LI6/q79YU7amgb5
	6Z4NbMkwfxoyck84fCr5SdJKJcV0YR8dxfuIgOecGuk3CLLko/koNbo681OSVdOPXDxV8k8itxjv7
	6T54IW7g0LJyx8kQ073w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIQb-0000000GmhV-2ZWt;
	Fri, 24 Jul 2026 16:07:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIQY-0000000Gmgf-3Dt4
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Jul 2026 16:07:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso3980485e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Jul 2026 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784909228; x=1785514028; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=aRhD3dU0WiZDqaR84pHhsHW4y7TmbD2dilCDdQd+6nPbC883SwqwHS5Yxvfog2Txbo
         x/LSS/HmeWi9a88IK5foEX581MmYRcVH9/8x6dPG80SKEzDcvQAzESXvPREQ9/vvsKy0
         1inMWvDRG7hghpy9p0tW1Y3lUidMwJVLFEXu7OQ8h0HrnmRO7i1xyol+bY0J35iaDk/s
         cmf25riI9vep8wLrVRPW/6v4iQfzh4075Lbct+FIl0dgLKliEPTVfmfN1D6u/xlqsjX2
         4TcuLFIz/1S5isz/lbhFiGx3j4SQ60xQb6a3rNfFaNi/GeGsFSEn/5IONFjngOZltdB3
         wj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909228; x=1785514028;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nhf9VFdcJj67d9mnRhCsj+1NVc5VUfS8waKbVdijXcw=;
        b=Iy0MXndliVbaPkteaD4q4UcmIOTYF5CUUNkzt78U2ZKe9uvJoxXPol+rWzPDplm/Nx
         ajuB43vee8hzU7y12cpSnnNgE6q8R6T0C/9rtiAHnChsdlTQvEIkp+LrQ64qAwWQIfn2
         6oN43BdBPn/N78RZkK+G0xkXFsSrjG7d+5gG28GoJkpeT+Jo4OSIZvNMrE4IwRGGzYJ7
         exPFw0PLDy9HuZG1k8O9NUKT5ehQ4zHHPbGp/Ja/DBmD9HZj7Zhe5RnHM/9L0o5xnZ9P
         do0fXcAIVkdLBRYYEgOd+wgfiRRjuj6rO8cNMaWu6zqYnGtFp6XtTfONqklFpV2+l4+0
         qbXg==
X-Gm-Message-State: AOJu0YxwhWlr9Dpk+8SeFmmvXCnOuzE/IZ7FRX1h0Ehu/nM92V93345z
	Po2GqAeOcb7QdUcaHas/DqLYwLN01mNmSKF57wQKrmFlnQUdhUXe7tlTUdsyI1PYxyk=
X-Gm-Gg: AR+sD13nziJg/kiSJVAi/neh7R7glgmr8He5r9M/cpOfqYQPbcvwPsabme3/j5/YPHo
	78VNaFpc3hj4spIgEovzmLcC1+Riu8K87OkYxv01XwLhud57vuFp7aH0tRTxsg4uDVpGzIkOlSj
	3CV5yP26T5kSEOGC5qdFqFu1ujcDLUOg00YhIuj08Gde4w4hdG0TL5e8SCh2x2Qz4pUyCvtERnH
	rqkTUMiz6qDvbufzMVaukU7KcyJaR8dKkfIRhSrKCFcRVOZndTm3igHIOyz1qBR5bY912WT/qK2
	d3vFGUdqEo6O2S4CKbioZKGdD143E9YDDM5JReIeBPdoDvUj2IrgRLmNAXC5W4nnXrTIxI7Bh6M
	RB0a76+Np7jKdyVigK29RfetLJzRqtXrrHS+9UBuvNTa1/5kW8OhBUXSe+hREzA178Hy4WOab4D
	Kh
X-Received: by 2002:a05:600c:47c4:b0:493:e983:806e with SMTP id 5b1f17b1804b1-49573cb963dmr58020255e9.3.1784909228253;
        Fri, 24 Jul 2026 09:07:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cd72:3055:a9af:4365])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-496b487a3e5sm734285e9.14.2026.07.24.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:07:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Brian Masney <bmasney@redhat.com>, Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
References: <20260701-a9_peripherals-v6-0-9630f39879e5@amlogic.com>
Subject: Re: [PATCH v6 0/2] clk: amlogic: Add A9 peripherals clock
 controller
Message-Id: <178490922597.2801722.3885834711328764674.b4-ty@b4>
Date: Fri, 24 Jul 2026 18:07:05 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_090710_813758_FB460908 
X-CRM114-Status: UNSURE (   3.72  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/2] dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/33972977d632
[2/2] clk: amlogic: Add A9 peripherals clock controller driver
      https://github.com/BayLibre/clk-meson/commit/f905fc7b7a81

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
