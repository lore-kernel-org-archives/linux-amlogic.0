Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E662CC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDDDiLOOTQI1T+CgcABDFNw3CIJtZjbjm1hnWA5+zQU=; b=0Bg6EZX9uHOn8f
	4yT0Xrlze8kVwfTFV3a85BGhrdE7jwXNTBxKupuquMVJ31AOdcW/i1Bdl2Z1zZryEi7aSy6KPLA++
	3D7KnbhUtRhftvlHQRFNYAlXsao9csxxSoWW0bxqQQ4BS7VSfCWtCD77cXDcqLdzPrHrn5jbDe2Z2
	d+/k1Q7cszDdBeE2wyhsIhAXJjA17oHZUTVo9OURsBxZby3Mna1zPdZauqcyM5hVlIQHgocr8KU0V
	U9XQ7mlL2U6sxKYMORPK9AfxIF3TcO8WQa+Wwsvoem+r3iIQfCZptLnL8ZzFwAplMkwoKbVxdB/ql
	hzvv/ntHQEhwmqzBMYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WqC-001oZk-2t;
	Mon, 27 Nov 2023 08:19:40 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wpf-001oOi-2K
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:19:09 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9947f488fso22561311fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073145; x=1701677945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0HbzSFHktdmLOX25jug4aYGWz0JCpvccscLtTAHhqA=;
        b=Mg4UvS2STqJ93S6uLud7akvGA1AxTeiH3V6GyO+Kdndbxc87PL6COUHXMEUXQz3Qvz
         0D2XhPCUg4D7Xxa7zZJ9ykgEBIMGfthr9uF4KBxGOzJmD63J7IuF7Uk2MJglZDPG2z+i
         qPbPt2BSA75MjvuWJz+/eQO4Y+LSphg0TMSC/eJgD3vDl5QdEh071Sezw/fSWqgcr03K
         444rYmi/It5VLkwHTBBBxBR35CXXCQXkFyNEQhCApQyfKZZSUjV53JQl8DuML+tMlAxh
         NNUf4yG1Nc66Ecfjdi3O6wwZ6ijRKC/eAb63qYBm0ruS5Ktr2i6bb9ALlu2uhf16fDeQ
         uhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073145; x=1701677945;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0HbzSFHktdmLOX25jug4aYGWz0JCpvccscLtTAHhqA=;
        b=WKbyYCsSciGMzQHKapIBW2tTDlyIB15DdoboCx3NwwdgPAhoe/o8iyA52fh98xHyuU
         PKy8639c7eRlyfptnkkSo1oSPS9ynz17JDFH1fZjAnFjPrTY0gBYoND34p8ee+u6+Xxn
         G2kD7rIgJkC09gg2YA200N2b+LTaD4lgeZTQemW6ARiXWlB6KomAah+Kpx+BX757vk4+
         rIAKnvI/k6p0pj35AUoqxG0hgVwhxkCtgqXcoHoKqDgyDYYi9fU4IEqkAeYi5xv+YQl9
         Q4RQ/WYnoLfrpNhq9L26/OiVYWsLzTZC0YcClfUurt45JL0djw2sDNCy+sVJ+OU2Hpme
         3SAw==
X-Gm-Message-State: AOJu0YyxaGY9UfSHm/JEjweqBp28JB5YBI4zSSjHI3B3W7GQHitT9wBx
	Z65ia2ivPWXhE6QqJHiNO84FUQ==
X-Google-Smtp-Source: AGHT+IEuMirGebq4a6v9lO8Go4zAoGpsFpnVjJ30a4fq7OT4bnU7eMDXEQmoxjW6cmOOXG5zErDs5Q==
X-Received: by 2002:a2e:3207:0:b0:2c5:15dc:ba99 with SMTP id y7-20020a2e3207000000b002c515dcba99mr6829008ljy.51.1701073145285;
        Mon, 27 Nov 2023 00:19:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm13516568wmb.14.2023.11.27.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:19:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Viacheslav Bocharov <adeep@lexina.in>
In-Reply-To: <20231102061233.3113249-1-adeep@lexina.in>
References: <20231102061233.3113249-1-adeep@lexina.in>
Subject: Re: [PATCH] arm64: dts: meson-axg: jethub-jxx add support for
 EEPROM
Message-Id: <170107314458.1083800.6313353700407370845.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:19:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001907_812602_DC260FF8 
X-CRM114-Status: GOOD (  10.30  )
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

On Thu, 02 Nov 2023 09:12:33 +0300, Viacheslav Bocharov wrote:
> Add dts node for EEPROM placed on baseboard in JetHub D1+ devices.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[1/1] arm64: dts: meson-axg: jethub-jxx add support for EEPROM
      https://git.kernel.org/amlogic/c/bee505184fd5543b9e901a37523e39fd1db06860

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
