Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96175E6FE49
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rrUc0aEbRUqs8KeWXFuWtol3Rnh/OJ/fbzJdtCJ7Rw=; b=eDwOPXXAxuy3/7
	tE1AazdSZBNhNe62Rfg1iUMJGlGEAolnoYguzxbaY3uz02FTFPoPAT5X4ikn/bx+ic740Ji80e4z2
	MEo8bltKk6Mb9Axhq9cCJUSH0WPaY+AdcFh/hI+lQyTPNNwT+mEotP0+38XGxe36RPk2LryeaSIdU
	HHOQguDMfujpYIKNU1qr77Ci+Mj+53Qj0PVBeGCtcDYFJsJDJsswGaIpFpJvJ9t/hGe9Kcs1PGvQF
	7a5+pE70jyedZqPIwOimIojIHdgNQuNuzTaiKB7c+/8M1VlccygxLWjHoV4LdSSD66JjJKEWrosdP
	S/8JcQNwM2dO9cWNEcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZ0t-00000000s0Y-1piB;
	Mon, 09 Sep 2024 07:40:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZ0Y-00000000rw3-3JpZ
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Sep 2024 07:40:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cba8340beso989005e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2024 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725867621; x=1726472421; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxk+0HV3ie5ca2PMas8a05vKnaU5pacSMpokYxPfcBg=;
        b=YJP7FU/LgdxJUAEIJtQLjDvBaTqNgQy1tquop8newAjVBQSck6SP9O86qekyOWj6KH
         GpWbObWqXKpa+Wtvw/wIV9uH5umEz/nQPXlzVZzXYFeOMbFbRi82qNzWuFtlbtKSwGy5
         9Lh7X9a+x/WpQM0A6NcH4fukCZ4aG52Qg4G9VbXTz/BfBXVw9sf2wdUaHFYp8RwPyd1G
         +OXy+X3PuM3bhr/3zfgL80gYYYwUCEZyhqgl+1SfzU0gAgpz8dzdgld1FqY28MfC1O95
         oiqjZEZJvnL7J2feR/cXVpr2FiLpBISqEi2HQ2SKaHAAm5VtfN/NKMBbnj/dwbd0kg74
         xfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725867621; x=1726472421;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxk+0HV3ie5ca2PMas8a05vKnaU5pacSMpokYxPfcBg=;
        b=VttAhC5LdqZbxJicY5qlvPV6zf/1m00al4kxkSv0fPjzdnlonCCo1qTioxvL+CRIa4
         A0XkqWRK44cgEsUippDJMU/fOf7IAFbVIhTgKp7OhTmqNKN1tX/bDfn+UoRg00DVQL2R
         L01pp98CnwfXRPtRwY4Xg50aotLdsHG+Lkzo+IjLFEaWad8HjS4/mo1iC8EmHVjpMdr2
         3DlQ8h0jAbo6qf+1/ABgLxsVCbJpXUcXMwbAXFziy+8iK1keGm/6sW9AwH592XrcIQbB
         FiN7oC2gluajJ5YVRqyobXM77tL4nCZd13MIcGTlZcL3xOyciKDdHKoFbeUsk3qHlWCx
         FFYg==
X-Forwarded-Encrypted: i=1; AJvYcCUNCaj3de+XdWvXb/yQp/9ml5lMphzwGcwlUOtGxhryoqE+Hhbyngf1qimGtcNVNPfGfj+WsC2By8eawOC7@lists.infradead.org
X-Gm-Message-State: AOJu0YwfYyni97v3DhEoZBlZib5DR06q0ouOy9W8T7nyfIGLibhCN/xE
	T0acXV5WKnqfF1Idg29uuo9R6TZFM69xZeHpJvF1eyJ4dCR0lUKPgwTIhFSXbIw=
X-Google-Smtp-Source: AGHT+IGLe1vcw8K+nWAka8XMIewFAvdqJjh2hBlCRr5j7xHSNC6LsISkBqOfC1/aAZ5SBH2fbxKxOg==
X-Received: by 2002:a05:600c:3b18:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-42cb697a7a6mr16044445e9.5.1725867619791;
        Mon, 09 Sep 2024 00:40:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8182dsm68716935e9.36.2024.09.09.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:40:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <46c55bd0-0076-4eaa-8b12-0e28f650e5bd@amlogic.com> (Chuan Liu's
	message of "Mon, 9 Sep 2024 09:55:16 +0800")
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
	<20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com>
	<1jjzfpqb5a.fsf@starbuckisacylon.baylibre.com>
	<46c55bd0-0076-4eaa-8b12-0e28f650e5bd@amlogic.com>
Date: Mon, 09 Sep 2024 09:40:18 +0200
Message-ID: <1jmskhtgv1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_004022_857563_D1FAE18D 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon 09 Sep 2024 at 09:55, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Sorry, I don't quite understand this one. Is it because you suggest keeping
>
> "(1 << pll->frac_max)" here, followed by "if" to determine whether to assign
>
> "pll->frac_max"?
>
>
> "unlikely" is used here. My idea is that it will be possible to determine
> the value
>
> of "frac_max" at compile time, which will result in one less "if" judgment
> and
>
> slightly improve drive performance.

I'll rephrase.

Please drop the 'unlikely()' call.

You may add that :
 * in a separate change
 * if you really really wish to
 * if you provide profiling numbers for the different supported
   platforms and PLLs, not just the one targeted by this patchset.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
