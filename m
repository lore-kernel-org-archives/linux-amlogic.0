Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB2CD29DE0
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xb94xkH8CkCdpblAomOsE/9LcMS4PtbInzmCt+yKApc=; b=O6aI7i94/a6tQn
	lwge/2zY14MXSBhv4xS4aP2rWhSPTGc4V6WEmXN6dw8MYE3vDNI3bqebpLlTZ4QZMnY+b4KOe6C+R
	lq38uzMA/jrWOya7uq/f9/Gif6d6srQmdefUuNpX+2XpZedftAWS1uTFLSE5dea5CMdYpogNxbNTz
	eVm9jOL8dAwJvZH7HeWf9ibrheettzIj6q0jIdyMjzlVBdP9R0ovUl1oaI1NLvG10YgLENMF2NnqZ
	xpek5HgWMgSvGGKu9ZWB/h2Mrn+gvA/kCeUZE2gmVzQ79eqlBugRaj8UCLq0Y8ZepvnyEknsh2yk9
	FFvbMhwU0HBDwKIP4KTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZKz-00000006hD4-0RJR;
	Tue, 13 Jan 2026 08:01:13 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZKw-00000006hC7-1UX2
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 08:01:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47774d3536dso52388475e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 00:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291268; x=1768896068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4XBvo9hLhqjOo/eKnVRLKDXh9Sql68mRuoY6ThvJY8=;
        b=K8Jb0DQ4qDGhPNDtxc6RCk4TbTccZJQjlWsJmgBwcJAu8FwiFlAW6r5xPq9gYAHQn+
         fwJIfxR84xi/WzoLqDb0oK9ZdpRFyLqfPhJwJ1h0zToWqiZxfroCvFh0oVwpojNeu6I/
         78dCVCx+7WP+V8zRG9qSN2MBVyTwTT+g1IBshX/vKLOtJ9rjWmLDqLdTdDSBvv9ajY65
         IpXHr3GV2H32UyD5A1niAs9xjFioW0GjjzC/WV/Q2RR51o+qAti29ZBp93qifp3POf+0
         ymF2J8CZl0MWzWOd9RoJU8wNHwjqT4wFz5uYvVBFKCNa3vPIJKV3a2jBZmZw0SHSXLRw
         rYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291268; x=1768896068;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4XBvo9hLhqjOo/eKnVRLKDXh9Sql68mRuoY6ThvJY8=;
        b=eNXN0W4mb/wlWWv7iHRz22AisG+8ZaP6WxIEd2ww2wm2t2o2WYbzo8uu9HqtI4uBAP
         vt6KEMYFGynAEfW/hfdwIa0EW7pGBXtbV2LIIu27KbhmSrcu/ptgMA2xzf9vZ11oZkmf
         jskn1ln+4uebQRtsgJ1cd2XaGwZK5vOmKUg57uQEn0mpk0eTbzKS0zujyLdlpyFRZbrJ
         Wq9znyHSyT/BJ6XwtoZ5edECFGxBg1qY9oXoYdVB+MK4OQUdznN8Ufn8+zP2Otim/2NX
         olRg52gYXtpa1QLzpLTebnmHbOvEHCfT3feE43dpFVtIOS0UCYRC3KdulN3OENnVoEbU
         PRCg==
X-Gm-Message-State: AOJu0Yy94Vj2w9e61q58QGR3UkdnPjFQhJRQi58tLwRxFlGmSmRMWis7
	/8U0V7CBBmZA06kWzbIOA/FXFRLH5LZe2E7AGekOo3Kc4uoMtoIeJ/hiulyJHP9ljMY=
X-Gm-Gg: AY/fxX7LgJ8PGdvau6KfbkX6SsAAMtI9zWVbMKZ/jAcYcMrPUCRfBOYK6ZeYmq2NhUW
	q1iDC+xnjWSxayu0JaEWZ+hI11yrquQvILeguWdQHu7azsrQhdRYSFntVEKvniDX1WBvV4TlIWN
	AcHLiXHn/NdK01uh3HdoiA2hmo4avD/j0ZpbhpallftHQHeYSxkrqA23kORgCVLojKRLVvbVaLd
	QUI366gji2Bwk607pH5Ei3aNGGTLtKk1e2AN/3zbHLjHoMYwRz2z/LPV2acyAGi/zfkUgeBR1tP
	YCQj1kIBMm52JAId1OcxGzWrEurSvJOLTViG1getQQXfopKtZRYGENEHZ9GlCeFfx4cGR1feWSd
	7pxxpRd7tzyBt9qsuSFQbNOL8wv9XKahxOTP2wqhwD0kkM4DHiH9OOs2RcB8nNBzccsk+7AXXRB
	3sxBDw5Jq7K5OLGtHn4A8=
X-Google-Smtp-Source: AGHT+IEfNL67lDlJu2bZvpORWFuC/UNgw2RJDGC9kVaQZva+lj1qWcsb+L91+Qwff3hAYzlXikNsrg==
X-Received: by 2002:a05:600c:8b44:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-47ed7c2afd2mr23274545e9.17.1768291268239;
        Tue, 13 Jan 2026 00:01:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::e97c:97dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8384646fsm358516415e9.15.2026.01.13.00.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260109210217.828961-1-martin.blumenstingl@googlemail.com>
References: <20260109210217.828961-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: move CPU OPP table and clock
 assignment to SoC.dtsi
Message-Id: <176829126747.3571714.16601287953745000295.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 09:01:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_000110_444495_0FA3CAE2 
X-CRM114-Status: GOOD (  10.45  )
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

On Fri, 09 Jan 2026 22:02:17 +0100, Martin Blumenstingl wrote:
> Move the assignment of the CPU clocks and the CPU OPP table(s) from
> board.dts to SoC.dtsi to reduce the code duplication.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: move CPU OPP table and clock assignment to SoC.dtsi
      https://git.kernel.org/amlogic/c/d7b70ebf2bf4a9983fe64b8c221db55f15c4c56c

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
