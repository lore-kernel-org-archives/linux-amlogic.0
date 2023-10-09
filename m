Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EDFE95A91
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Oct 2023 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D30yjZKBxHOx2H/LXHVfvDQrGfpeAwgztGoIdyZ4IF4=; b=YdJqKJFE/oZgp1
	hfzp0+l8MmODPoXK1uw9D8g9rQyPB0t+/MKwbthqPdxcxcVW6M9dyUuVr3Zzal3wQVrFRNNhM+X/X
	nUKPOzW88u6rrmfEHqKDP0jK6oTNKfSno4jGNuiKMmLFKpdg7sd+G86N6mRaNmBhl4dOpILKAfdjp
	+EyQtcBdOfa77uBab2JYHg0pcELvhJeoiSmzqVHersUNVGlWATS1XtmX212RkYZnqX0Z2whoSHRjG
	zMkwa7F680Lv5UjMY2auK9V+3OLyKGWOQKiUsl+8xeZAslTrDqfhuqmPwfy5C+1M2CC46Kt4+oT/c
	PeORE58Q9CxmkbeN49Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpm1Q-00A1rR-0B;
	Mon, 09 Oct 2023 08:53:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpm1N-00A1pp-0w
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Oct 2023 08:53:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32799639a2aso4246674f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Oct 2023 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696841625; x=1697446425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5pyYgDH5Sj0yCWzvyS4ZZ4oeovk0or3XiHl2Z6dYIk=;
        b=Jek11++8tFYFHUbNSaejg5k9ZdRZKfORSedHaQlvpUZ4ueUwXiRd++C0zVICb+0QUH
         XTahxtq0wZh+BIa/L57TvPXMTCi3pwAwQQ5kvbtBT+mzPkqayZvUCfr1RlGYT77VqgAY
         sx1XizIqSBkalxEIvLjP7SyKm4kxVMjXvBFMk7LwPlnlfBSODjnm5e2VlRIkNWdJMb39
         QP4rwwLkxyV6MdowIXWeZ6Gy4voHErAx0oUldz+cAVsJgOItu8P11KGVYK8WYIIzcz1k
         ev0oTn9satGLuphwkrt8lqX87U+xv3gvuA/bwd2N0EpIXuxRaZerPA1sX2wqP3ttc17n
         4Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841625; x=1697446425;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5pyYgDH5Sj0yCWzvyS4ZZ4oeovk0or3XiHl2Z6dYIk=;
        b=D0IazYyGCj/+qpdqQROXP6msfzAODqUVDIT3WZE/GYrqHhKUbB3dkvApWPZpotap50
         DKwp7+/npGSxreS0hktZGOE3mOa2SJ2J8r4f+M41RcGqubxaV/3zhNlJCunVvL2V/NbK
         /qZELP2+V+bPnHkkF9pBmwGAONXdfcNd67VStQGhh3TNprXgxqSNjUG5/bfD6SztDZjQ
         tuFCXHhnzDAgSewEHi9PnFXyMzVD/FIQJXzHZqOJ9fnSede0k2CUWhfUbA9uOYRRMOrD
         +LWArZq2CXawkZs0HgCR2axkVDzqLiHEEwEPM+eCon1jZIuvVjX3Bhk/cDCwMSqxA7LJ
         ZsxA==
X-Gm-Message-State: AOJu0Yy+vaD//lNQMGUk7jC3yBlX/r3fS3ybrr4wZyNzlzH5r02ILzKx
	hpPisSbqARpNGeIp99/pP4cMiw==
X-Google-Smtp-Source: AGHT+IE4vUOSiqi6La9eRS2WThKGCcdTlP12sUEzDm+D85CLrud1dbwZUTiOhB83Ya/8gzG6puFrSw==
X-Received: by 2002:a5d:4b83:0:b0:321:67d8:c3e7 with SMTP id b3-20020a5d4b83000000b0032167d8c3e7mr12281114wrt.12.1696841625518;
        Mon, 09 Oct 2023 01:53:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b00327cd5e5ac1sm8991293wrs.1.2023.10.09.01.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 01:53:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jbrunet@baylibre.com, mturquette@baylibre.com, khilman@baylibre.com, 
 martin.blumenstingl@googlemail.com, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: kernel@sberdevices.ru, rockosov@gmail.com, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 George Stark <gnstark@salutedevices.com>
In-Reply-To: <20231006114145.18718-1-ddrokosov@salutedevices.com>
References: <20231006114145.18718-1-ddrokosov@salutedevices.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: a1: support all i2c masters
 and their muxes
Message-Id: <169684162458.1721642.4981254140997404903.b4-ty@linaro.org>
Date: Mon, 09 Oct 2023 10:53:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_015349_328524_85AA9A8C 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri, 06 Oct 2023 14:41:45 +0300, Dmitry Rokosov wrote:
> A1 SoC family has four i2c masters: i2c0 (I2CM_A), i2c1 (I2CM_B), i2c2
> (I2CM_C) and i2c3 (I2CM_D).
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/1] arm64: dts: amlogic: a1: support all i2c masters and their muxes
      https://git.kernel.org/amlogic/c/f2d2200e47e942e4df16f0fe8a30aa1d91e4831a

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
