Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FBACAC58D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Sep 2025 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TveuSaqCVVpYTKr9kVAUY6gWj2rmvgRVEYBfOs8K3/s=; b=YrmcxPQU2mcu3x
	FekOTm2/rkw/0//69yyutKfQXVS0hvunQi0NfzqWDzdokwpXw3KLjkGuedh/N/8K5fKze5IsJVQby
	4O47RrUNUNm4VeLwrwRFNE9SmpdPTVbPqNCv3Kw3eO9LIGDyy5CdbC7mkL0UoC3pgubnv3NPAmJJ5
	frJHlQGtQTkZSxx/KAU2DoBTs63R3ZmbQcK0hU8s0zWPEwKs6dYqUago8xR48PAyQuxLUyUF02f1p
	lOPUG+cr/pq6ufRUPaGc/sTlPwus7dR3XoIxsGKhkA/8cHE9mv0+c/p3FrynZzA2Abu99iVVI6jPH
	tGvUy8VhCJY1A9vW9mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSO-0000000CdHr-46Ya;
	Wed, 10 Sep 2025 07:41:32 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSL-0000000CdEp-3StT
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Sep 2025 07:41:31 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45de56a042dso21741985e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Sep 2025 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757490087; x=1758094887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQINu9fJW9+xt1bW69VqgmZeDthwxC6ZybeJa/0e4HM=;
        b=ce9DX1YEmGUmGXHCHy4WoAyhG1Nk+xPt0ndFDpLZmy5bo+WvisjMTDk5Yydb1aqSLx
         D8YC3QTlmGqrQdD0M/XLOsA64a7cmMQngZorQqnkX5EobbwdjDZAQBNF7s6HlvhGFaJn
         uUjWaXvqepAysHiLVVmah0AGXNuMK6iJScXRyM0+mE7oRQU/Ucf854p0PPC4fH1Aw8Lh
         1DXNdfQ/gK39Pv07PklV/62+A2Z+burmMCGbgDymKPZ5qH6ZnySfium0NmKy4nr5QcDG
         ZH1xsFKZW9pka3/vxcoZrqE04QNNXX78IpXPoum5JaugTAL1ErqFA0EWS4vDHE9cUJAv
         D35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490087; x=1758094887;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQINu9fJW9+xt1bW69VqgmZeDthwxC6ZybeJa/0e4HM=;
        b=Zdt3aRSkO9JXu0l+4XdgK4O+VS7344rHfS822NQ3J4PvpqIKeSKKeYHO3MDQauIvkB
         9O833XeZ0G22SEAHKTGw4sqSYnMBdrydkJh4byw3zX/+cLVBcHxAT8W+I1+rA2txpmUN
         RC4nrhVafa03dnfVlbevTc6WVkzxhJ77I3Q56WYBo2Y1qQzl+xV+ny4qIQHubf+4r+HT
         5s92uhtLxZeBwDg5dIZfcbcSBKrShhdXiJl//2Xg0L0eQVLEfb/W5fUBdCNfjA83mFQh
         YFxdbf5wKVUojz4oARt+6/bCkJAIvZZgOXozIsPW0EWWZ0z1GXb+xItZ3d/qMsHnKKoT
         sJGA==
X-Forwarded-Encrypted: i=1; AJvYcCX0be9AVM9eCkKxZCxAgLWjjojNxoeyJL8+T2Sd5ITIuQmRMEOd/DI2yasI+47PkuExabrlhB/MpMFiz291@lists.infradead.org
X-Gm-Message-State: AOJu0YylFiJ0Vjc0mZAI9VqLBUJePV0IeoayWy0zVNRd1dUHSYF5/ipN
	eHRoh4yz4geVSZyc1QGYsG91pvnUvGvxQuNOSwnYCZkIsj7UfBFbGmcgVvtV6hdH3+IDwtBAvj1
	pIjD3AsU=
X-Gm-Gg: ASbGncucpJ35JN5b82672vzFa5aYAUCZu8x9AEadk4sjhsDaPMdrxrQJk5oywPuiozh
	eSTueKDEKAq/ArhGlxM2aDDDShmCVvPSDYXvTlGHc8lNoLOiTB9Vy/gNMQuNXT8r8l4kBJQ9NVD
	B/7q0khfXq2TZO4P/XMo6rUIdAf1YFl63bEpzW1tycqOaMSEb9J23+lvhgBAtZNXu7JlL7oYcf+
	XAsKVrTO6iZMDSQQ6vn6r2fRNzKnlryU+YoS7KLV1J7RuktWk8TCb1CD9+I4U8CIB/kJ6VeKWou
	KHD+eE37yFM2jaiV3JiA0tDd8dNK4NIepPz0mwrt1atUneuP8C3//q4vhML+QwvSY35Q9cUhFRd
	Dvicx2/EjRd2a4NtgL7Le6INb4m1aGAo+trddtXuqsISiKVDhYVHmhw==
X-Google-Smtp-Source: AGHT+IHFrHs/AQbTtdmpcTDbnBfFFNqmYeMTeKOdyAzndhMB+Fk7gzlF81CDMGzg4BTKrAQ7R4nr/g==
X-Received: by 2002:a05:600c:c177:b0:45d:98be:ee91 with SMTP id 5b1f17b1804b1-45dddeb8f1emr124260285e9.9.1757490087519;
        Wed, 10 Sep 2025 00:41:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259cb1sm17003035e9.24.2025.09.10.00.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:41:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250717-fix-pwm-node-v2-1-7365ac7d5320@amlogic.com>
References: <20250717-fix-pwm-node-v2-1-7365ac7d5320@amlogic.com>
Subject: Re: [PATCH v2] dts: arm: amlogic: fix pwm node for c3
Message-Id: <175749008683.1189257.13747268542905887474.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 09:41:26 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_004129_878883_9D9BD754 
X-CRM114-Status: UNSURE (   9.11  )
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

On Thu, 17 Jul 2025 17:29:54 +0800, Xianwei Zhao wrote:
> Fix reg address for c3 pwm node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[1/1] dts: arm: amlogic: fix pwm node for c3
      https://git.kernel.org/amlogic/c/f8c9fabf2f3d87773613734a8479d0ef9b662b11

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
