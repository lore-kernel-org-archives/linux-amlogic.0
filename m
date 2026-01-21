Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9FBC44536
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jan 2026 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEP8WWaQqkXg9dMnOwGszsuvpvChXSBwNOUcfyUjrRo=; b=LU8NVp5akPwKBq
	9hGVxwDBKLVpbIuTGzNfk0Y6bZ2uw/klHbcDgrl6syGl7VofatSr8lTH52mcF7kGkGMzNxvPw2tPR
	3nJ+wQM7VxCpSI+I+SF6i69it+L4mui2rqbjw+8XqGApGwEFtpAEf8HBO7YjTtJDJQG7lmzoOgSkd
	D0iXjERamqLn785gpUpaYHBZWqP12rAenlo8H4oReEwwJwcc9PuFz5pr7DFxi1TyL7iKMHdyljA6d
	CyLQ6Bwb0m8vStweFxoKPpbgm4b3pCdYUJZvfLS3j1VMLF4BDrfJQWhfz4f6OC0F6+rnlI1Q6TZw0
	siCbyfXXurqIj/w1HOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibKW-00000005opI-4C23;
	Wed, 21 Jan 2026 16:45:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibKT-00000005ons-1EjH
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jan 2026 16:45:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so893955e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Jan 2026 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769013911; x=1769618711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrVrJ2R0M9gIk1FFgofj0nCEI69CS6cLVCdJv2vwzhw=;
        b=IUMsdJ85NSwnF7Bws+r7fogQ+M27w6uOWyPi1T3L8WDC/VVh5GHMGcfQnyo0oo44q/
         u0CJyPAy2Zj4si4a2lLwSDS1Po3JrYQzXim76TBsr4FALJewVvO0F4JLjFip+NU7EZk4
         gPsE6VDLBj19ZQmx71aCDpHBVCT1SAEl7lm8W/9OobH5Z1o+0vXfV2GHzYMqgvylPYw6
         gvrKPVa1eXiQ/Fh7Ms7u8Aj2sblofyUenvSqLEKqASgd/0+YMgaTmdpM1Bqx6xzGQiVA
         eHCgfTd00puTbzNvo72dJosIP+Q/bWWrubBVjnUwb/nnVSjy5O7/Qu5KHClbZK4K5wdQ
         LMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013911; x=1769618711;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrVrJ2R0M9gIk1FFgofj0nCEI69CS6cLVCdJv2vwzhw=;
        b=DhTKmEdJwwvBlbhDFJn0Aw6ANr75eWczqtu5hw8mSni92EyUkNxCdK6kLw2Lw/Fuer
         VCVgowP1TgLhx+Edojsm7eRdANbpx5dXZMzItqFlKp9r95yl7tv3JLoGLrf6W6pDqDcc
         qNsw8A1/dZsLCK/LXD80ur2iRcK0WgEs37I9ANTEOKmS6ytvgGsjbEivbReZtJLXJf3T
         dO9TXVZt387x6l3OdwHe/M52tt6jD/1F9mglwFnHvTmV1btNvovnVG/sdZdcbKIjYMvu
         /dXu8YKb1cRoYXLCGXr7L9pps411ycx1mxz+73DqaPiSC8MY6bc0unfT4zh0Wecy9bGD
         /VzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBdPrWgO1a2Tjzpiab/e7J7lQUStJBNple0iVxWia6piXoXjK04RqGsYtE7KEvNtHyG23wrMfqoDOnDhvW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0tybCmrRAHcp8eJikybjY5CANzsOaQSPZZx0HsSdHwv58m02+
	6fVeBTA9YovDdCWq9puoGb6jqG/QmnnZkyV/HMcjFsbaAQ2loYtUhkVymNNFWr/J1fQ=
X-Gm-Gg: AZuq6aKUoiLohpg4IR3tVdyCY8maOnhMvBEOe8TXFhFXFRQQamFhhZMWapwlS3SVs9X
	wzR+KpV+hgb9dTeDvz7vrJnOSlqoLLXu5nrWNfXbW2FJA1pg0ktBtZrDcrJG1SNczIewgxNV5li
	wAGk3+sCic1ALnWSjNJuOkTw/EnKuaUsKl/oTrG5Rh4v27d+DlZWciNQGgJn3mz/K35uDgIFLWA
	GYHAWbqWroMzyHs9rGLdXIL1VhZS3vBHHVJTDkD/Nh5DWGzcrkSzQWiE53zSqKXPMWMXxy9L0nl
	98TlVYyAXa0XJF/pVxj4n+XYdS0YUgANbHYG8JW709qb/Ev4TAmd0ieJ1Rx9EaW9MPYXDRjfeL+
	VqEw+Q8f19YY+HElHp9iPEjFFTq7/9wCDTjem1OAkn8T3XpbY0vinx66jCwPOowd7eZjB1U67C7
	0F3iPwEa9HNKYaLe/GGGyrYKnngXl/0sY=
X-Received: by 2002:a05:600c:3b17:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-48040a258d6mr85202485e9.1.1769013910648;
        Wed, 21 Jan 2026 08:45:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470401cbsm1211415e9.4.2026.01.21.08.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:45:10 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 xieqinick@gmail.com
In-Reply-To: <20260121014725.122722-1-nick@khadas.com>
References: <20260121014725.122722-1-nick@khadas.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
Message-Id: <176901390954.10662.8672885431997370730.b4-ty@linaro.org>
Date: Wed, 21 Jan 2026 17:45:09 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084513_350956_873D43A3 
X-CRM114-Status: UNSURE (   9.46  )
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

On Wed, 21 Jan 2026 09:47:25 +0800, Nick Xie wrote:
> Enable the SDIO controller interface connected to the on-board
> AP6256 WiFi/BT module.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable SDIO interface
      https://git.kernel.org/amlogic/c/854583f9992671411bad28bd8a3867afba7cce77

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
