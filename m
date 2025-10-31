Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1862CCF9FF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxNIPJjOHHmtcIU0YASGP5t94MPqh0sLUIigp7ukhhs=; b=gMEYQ5BhgDgCMV
	Ixf3jTd496pB6CSIkIiNoitEq5W08DZPkUhkJ4Cgo8C8gIABCW140MBMGKNj4NH37pCf1iK1mNHMy
	hxnzOBHX1oVKLY4EEAWBI/QUhnBS1qFgcUPMadpDzxjrJjL95YeKhuoA7cx6EUptallf886mjkis9
	bLBgpsROvmjjRt5vkbM60hhyhsMJdbEsm6lYMKkamEu7kcvQglkZaP0r8qsxxl4D4yi5demYy82lg
	Nf0cX2iOs7jEiWOOhplG8r5jZpv4Fe0kdtywx4Pg9xqSjvAnhVqIddLyocCCCFvKRzBWYrSg/PYiP
	OoMkkFrbYE+pZNb4G2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3y-00000005kD1-3k0Z;
	Fri, 31 Oct 2025 09:04:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3v-00000005kCB-094p
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Oct 2025 09:04:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4270491e9easo1723174f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Oct 2025 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761901485; x=1762506285; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTUxY2QRsBa4YiD8QVHQP1f7QsWrz+ePLEmHRSCQsCg=;
        b=RB+w/zgjW0h5AKHMa0lNR58FuYPiIFRjgbwOAD9PZClTNcaKQeHG2KmDIeIv6jvgH7
         reSyyX4qJfxmCFaA9D9M9wqdXXbsU1V4EOZck8yMDUB0H/Dg/YR7JpdnS+LeDUCMwr9X
         ve84q3XjVSXEpUnPxC62b6wVhcFKKiNyC0M0mT/HXi94j16QWaTA4L70vFr8nWCNnJSR
         2xrANezGUeEmDPKszPy8ceh7PgEOlZwJmEUt4C5SowrJnm647EdF6udp6OzulSk1J8Qj
         ISGqXu2pnMsRcG/jsv3LVxZRQ5mjtSvSB5YhLHjTs3pwGjkPIe6oudsoAeHCjlprtOgj
         WyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901485; x=1762506285;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTUxY2QRsBa4YiD8QVHQP1f7QsWrz+ePLEmHRSCQsCg=;
        b=pJyw44mlkp6OuHUyoW0YzyzdA+V0wKFrsmzbFgZdqyJs4VRJ8GIhrzsyR14msWOuL6
         SQh/SLzFcMaUxTrrF+1asyyf758aEoxL3RuCbj/kv9mzTIR6r7W1B6Crgl5MZfTqldPo
         Fn/mApasD1W3Ue3YzbatlVbeg+wqVCazzxaELGjOnctgU72dUPdNiZzmV11Sc1ojieKb
         rFxuk2AmAVZClyBOkMzXzUMBQTWAOX9ib66pTLEtrUvaXMJ2Kt2yeVn85dzelZhxLAyL
         D5oTsQkl7+2d3ci0neFc1zXwEeNj3Q9kXpQGSJIQVWUnGtk8iuNhQTuQDEOtLpSpnDuj
         NULg==
X-Forwarded-Encrypted: i=1; AJvYcCUACCQpHQhxleUHQV1rDruX8Kk6duiH1UFXX9y7/HK3d3sbv87nZJwzK+T3Y33Wp1od9bYvJzN5xq5xjsOW@lists.infradead.org
X-Gm-Message-State: AOJu0YyhTs8UpJrZ9q03jZgEeicckvrDSjsQ6nx/T0bc8JRj5E1pmLQx
	LZh0a838dP1tVgPm/TD+dmAI/jBfgG+4OoAE1JHSfoDJvlNrn+W6eDGacdPzsHnV+Gc=
X-Gm-Gg: ASbGncsrkxHGniDvQOfbX108Hv5jFm1RUvp2ATVdi2+R8v/Sn9H/yhilcENw9yhckyj
	i11/ax8YDNR3J8WpTNiWB4GG6xbd8IUlwzDkfJ9ARcHAN52PO1ZD+bqyNLIB06HqsTogJbi7cbQ
	6PmZfTGar1kRshnGXqs/yrMfP6nMVvAoJCZVZKyOiVd4FqBbZki2Ng83GLUNfDt1KBufPVKK5st
	OsrmsvuS89PdJgGmx+KmQKF5BSVJ2Jh+ufSvc9fmDgEtsYFqeto0LWcHgttlukeBdd2eikxCgv+
	QgyGeNEy83TpW5nILCA0s9DUdO+hyqGxsw/9wIWUm7wvnqLEagnWk27+g0juZSfDR9uCTVGS1H3
	DeKclQ7A0jSn9Lg21am9H4a17ohrBv+7PTSR19EhVm+Y8SVGcFgzpfZSvnLp3hyS+pIrMIKVBkD
	o=
X-Google-Smtp-Source: AGHT+IHz9Ep06R4/artcngFbJlB1bKA2Girkc8hxPw+EQjUGEBiqGYPMJZdtFD7tESCBa2KyIazeYQ==
X-Received: by 2002:a5d:5846:0:b0:428:4004:8241 with SMTP id ffacd0b85a97d-429bd6aa277mr2136641f8f.40.1761901483472;
        Fri, 31 Oct 2025 02:04:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b8e9:e124:10fc:8444])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c13e1d47sm2392315f8f.23.2025.10.31.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:04:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: amlogic: optimize the PLL driver
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
	(Chuan Liu via's message of "Fri, 31 Oct 2025 16:10:07 +0800")
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Oct 2025 10:04:42 +0100
Message-ID: <1jms57xx05.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020447_222713_ED521973 
X-CRM114-Status: GOOD (  25.37  )
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

On Fri 31 Oct 2025 at 16:10, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> This patch series consists of four topics involving the amlogic PLL
> driver:
> - Fix out-of-range PLL frequency setting.
> - Improve the issue of PLL lock failures.
> - Add handling for PLL lock failure.
> - Optimize PLL enable timing.
>
> For easier review and management, these are submitted as a single
> patch series.
>
> The PLL timing optimization changes were merged into our internal
> repository quite some time ago and have been verified on a large
> number of SoCs:
> - Already supported upstream: G12A, G12B, SM1, S4, A1, C3.
> - Planned for upstream support: T7, A5, A4, S7, S7D, S6, etc.
>
> Based on the upstream code base, I have performed functional testing
> on G12A, A1, A5, A4, T7, S7, S7D, and S6, all of which passed.
>
> Additionally, stress testing using scripts was conducted on A5 and
> A1, with over 40,000 and 50,000 iterations respectively, and no
> abnormalities were observed. Below is a portion of the stress test
> log (CLOCK_ALLOW_WRITE_DEBUGFS has been manually enabled):

Okay, this little game has been going on long enough.

You've posted v2 24h hours ago
You've got feedback within hours
There was still a 1 question pending
The rest of community had no chance to review.

and yet, here the v3 already ! still with bearing pr_warn().

Chuan, the community is not dedicated to reviewing your submission.
Time and time again you ignore the feedback provided in reviews and the
documentation. I've had enough of your sloppy submission.

I will not review or apply anything from you in this cycle.

You have been warned multiple times. Every time you ignore a review,
you'll get ignored in return. This is how it will be from now on.

>
> - For A5:
>   # echo 491520000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
>   # cnt=0
>   # while true; do
>   >     echo "------------ cnt=$cnt -----------"
>   >     echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     en=$(cat /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable 2>/dev/null)
>   >     if [ "$en" != "1" ]; then
>   >         echo "[ERROR] PLL enable test failed! (clk_prepare_enable=$en)"
>   >         break
>   >     fi
>   > 
>   >     echo 0 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     cnt=$((cnt + 1))
>   >     echo -e "sleep time: 1 s."
>   >     sleep 1
>   > done &
>   # ------------ cnt=0 -----------
>   sleep time: 1 s.
>   ------------ cnt=1 -----------
>   sleep time: 1 s.
>   ------------ cnt=2 -----------
>   sleep time: 1 s.
>   ...
>   ------------ cnt=42076 -----------
>   sleep time: 1 s.
>
> - For A1:
>   # echo 983040000 > /sys/kernel/debug/clk/hifi_pll/clk_rate
>   # cnt=0
>   # while true; do
>   >     echo "------------ cnt=$cnt -----------"
>   >     echo 1 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     en=$(cat /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable 2>/dev/null)
>   >     if [ "$en" != "1" ]; then
>   >         echo "[ERROR] PLL enable test failed! (clk_prepare_enable=$en)"
>   >         break
>   >     fi
>   > 
>   >     echo 0 > /sys/kernel/debug/clk/hifi_pll/clk_prepare_enable
>   >     cnt=$((cnt + 1))
>   >     echo -e "sleep time: 1 s."
>   >     sleep 1
>   > done &
>   # ------------ cnt=0 -----------
>   sleep time: 1 s.
>   ------------ cnt=1 -----------
>   sleep time: 1 s.
>   ------------ cnt=2 -----------
>   sleep time: 1 s.
>   ...
>   ------------ cnt=55051 -----------
>   sleep time: 1 s.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Changes in v3:
> - Fix some formatting issues.
> - Move the 20 us delay after reset into the corresponding if
> condition (no delay is needed if there is no reset).
> - Move the code that releases rst back to execute before current_en.
> - Remove the patch that changes the active level of l_detect.
> - Link to v2: https://lore.kernel.org/r/20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com
>
> Changes in v2:
> - Modify the judgment condition of 'm' out of range.
> - Split the PLL timing optimization patch to make it easier to review.
> - Link to v1: https://lore.kernel.org/r/20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com
>
> ---
> Chuan Liu (4):
>       clk: amlogic: Fix out-of-range PLL frequency setting
>       clk: amlogic: Improve the issue of PLL lock failures
>       clk: amlogic: Add handling for PLL lock failure
>       clk: amlogic: Optimize PLL enable timing
>
>  drivers/clk/meson/clk-pll.c | 64 +++++++++++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 25 deletions(-)
> ---
> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
> change-id: 20251020-optimize_pll_driver-7bef91876c41
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
