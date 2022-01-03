Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D7DC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QIwhfVkQ8ix6PnKPOND+hw9iKAgH5/qbL9qDqlYhAs0=; b=pjVEXPzDQBvHY2
	1yiKIPi37FcAlkhOyQGcmOD+Dpp5Eth4K/W+pTUCp3X21RLZrzHAWkefknobgUYGR0G2mLjECMp+f
	1uIMh8ch9l3tAPX0LZgNG5cAByIEVCC0xeYcMdwyTDjrOKOEv1R5Q8bDmACVkSO3fFOTQLTv2hOW1
	0lMsxkctM08PWvpVRf7sCGlPN5k2rgQGb5dLXe7YhLk0OpFxxEOvKD2h76Chcc/pkKZPsbjIHKkvd
	7jJkH7qkkE/AG/CcPWcp59f+h9Fc0PT7YprjYaFof0nYBek6D0+89UFvVLRMbuqSujFnFwZ8iuIdu
	CfGHKdv+53UKK0GuYVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4P1z-009IPp-1E; Mon, 03 Jan 2022 15:13:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4P1v-009IPB-HG
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:13:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id d9so70576075wrb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=89lR+zDjRzcCkSkX1JPsdOu1K3piTipFhOC7dPxe4NU=;
 b=MiNyYMWW3GcSKNgz3fQmmCssLainwBBZHCJ3YU39PhwZwtQfmyuPE91qZLgVF9n70k
 2gsgJSdiHIc+rcKrtq3WNBQTwpzwinlISe7uEZtxzdzQrMZzenlb/ow0IHoiRgtH/Icp
 wjVyZB6m3Fo6EKKUTvZ/bgI330NMBWW+8/+QZnYit4pEh8/Xk1sqfEAHDpsXwrG5+LI9
 7jXbDvBfJpeyoYzbm/soUAk2qmjqtep220a9OlczV7fD2nXQgW2rzVnLrV2O2xiDmWwn
 cqGR8G/i3gbW9XO2AWKttEhP+tlLx96xzznRnKOzv7wlmOc09sshkqjcw+0tx4BukO3N
 TVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=89lR+zDjRzcCkSkX1JPsdOu1K3piTipFhOC7dPxe4NU=;
 b=Dx7tx1Rxjus975S0SdRagmNKhJcTihLQMAcNHZbUoVg66s6zsMlTDjLRF4Hgm1JI08
 NpCqbL1U5wQ8840GROWYTpL1+q+aDqJUsqpCIFtFb20rIwG7ti9jj1zbzyuJlOHQsW3A
 7ldyupWzQHsG0+jJYdNQPZM8eM170TaGk2oJND7+4focEWon2W+DMpuSXbFjqHK4utDr
 CjPfrajJUwK0nYR4/m2YyDlPNrc82LWH+wT9lN1SjCxGU/rw0d4sF8rB7pfK9PTPwxsM
 YVYMGFKS0IyFQ4xwe6QLzuazO/EADLGo+mOnzbq4KPbbPh51Lja8n8etTnuBFrgQfwad
 Gx2A==
X-Gm-Message-State: AOAM530Bi9o0V+Wf1T/1/BGfj7UFsVAJvLuXlM3fGSehdVvBs/ydoD7g
 m5g48uw8LOfo60iZP4Y2DXixcQ==
X-Google-Smtp-Source: ABdhPJyYYTVZc/KWM1oNKQXkmdI6QONhDN1vhFHfjzjzyoFH47Tp/AQ+SoEvN8MixV+xRd+zij0iuw==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr39331141wrw.116.1641222825999; 
 Mon, 03 Jan 2022 07:13:45 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id d143sm33347662wmd.6.2022.01.03.07.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 07:13:45 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.17-rc
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>
Date: Mon, 3 Jan 2022 16:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_071347_636214_3AEA3551 
X-CRM114-Status: UNSURE (   9.75  )
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

Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
applied by greg in the tty branch for 5.17.

I know it's early for 5.17-rc1, but at least it's in the pipe.

I based the changes on your dt-5.17 tag pushed to linus for 5.17-rc1,
if necessary I can rebase on v5.16-rcX.

Neil

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f

The following changes since commit 8b0c59c622dc4dab970ec63264fb5b152944ac80:

  Revert "ARM: dts: BCM5301X: define RTL8365MB switch on Asus RT-AC88U" (2021-12-23 00:18:45 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v5.17-rc

for you to fetch changes up to 7a31a29b35386b6d6aa622d68acd31739a3a8ac5:

  ARM: dts: meson8b: Fix the UART device-tree schema validation (2022-01-03 15:49:56 +0100)

----------------------------------------------------------------
Amlogic fixes for v5.17-rc
- meson6/meson8/meson8b UART compatible fixup to fix earlycon

----------------------------------------------------------------
Martin Blumenstingl (3):
      ARM: dts: meson: Fix the UART compatible strings
      ARM: dts: meson8: Fix the UART device-tree schema validation
      ARM: dts: meson8b: Fix the UART device-tree schema validation

 arch/arm/boot/dts/meson.dtsi   |  8 ++++----
 arch/arm/boot/dts/meson8.dtsi  | 24 ++++++++++++------------
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++------------
 3 files changed, 28 insertions(+), 28 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
