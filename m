Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4548FC11F68
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 09:20:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDF92610FB
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 09:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDF92610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRZ3uI7Bfhn2athlQMbRo2Cf2sJU7DQIYGM5tHwJkKc=; b=RAhbgQxGER1N8u
	hl88zsYpKwXA3vIRmsm48VdrbB4FTHqelK68WdEiDzKsbmPtSGioNKnpRhzgP3EDeqjVOLb0mYv+G
	EZi2WXpHi0aHzfARy3JJMXPgUx7nrv0ACmo8Z0q+EhIbtHOspBcWKLX3BxOHkDwT2MXfyUDNPCAQt
	BytKnnomy8blInFag0Q3gB7Ca/6W0kxHjlVxtVdWa+szT/Mcx2rgKiNyrLZ1VtAWf1dNllYjkc8ZF
	BSKj3z7vZUljblMVyeXrqPIEKBpl186ZI3Gi0AMzSgRchZgdjJYcIPRFdwq7LiC5eokpp3SQz5xKj
	NgBPYo8lmVZDNnaqCbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzFL0-002bOG-QJ; Fri, 02 Jul 2021 09:19:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFKx-002bNZ-P5; Fri, 02 Jul 2021 09:19:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i24so12333848edx.4;
 Fri, 02 Jul 2021 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OgGUwiD86E754SHPP5c8vn9EyEoNKXunTKK1V9Pgukg=;
 b=M7SiC9cbH6MuqHUMzemWrXHCkuSRqABHEz674QXB0rpS8JD+5XXrJTmLG7A+atareB
 bNhGKhcSiOdeygKFSU2ITr6TpgEtDSkaTDSO7eEEP6+943nYaXu4ZqsJ54d27jxLuP/j
 u+c2aJsMJvm6bhWsWUgpvXNiiydkrpCVu0qULXRlxlGxsRqsXw4wYbxHVXevgRbSOBWW
 4x3P4jLmLYZ2FSlhQ2TkvrIfSug0zi4pul4grzYf7YnFBAFZqiZZDEab81pTXqejRryt
 ix/3O+pSo5XgFAT+eSZoxs0W5/RhsL4EBakDgqMEak5iWtpM5AIQUebQGu54x/D79Gb7
 inUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OgGUwiD86E754SHPP5c8vn9EyEoNKXunTKK1V9Pgukg=;
 b=rhWVDrkchqblFcmiXl3CgctsT0T3SMdQEoLULCwT7n1XkgTcj2iYjwKEoOoeQ2rWBf
 xupW+35Y9cJg2+74fxV7sY/l4gW9Uf/ewpRt/4n3xcAHTcw0IYaV9n308vPNf9jGCVA3
 1a23CHyudlYtYvAqBkZwuFF//GoksJvT5FJKG67YxYzzjZhYbcd8vDtorEwcgzphSwXS
 cLhpOPYYuOAk8x+4AVWqI/GX9jMOeyxqhtDIFYUlMfBTFuDdbUrz8uKzj5qcG6FytJPg
 u/aMVDwGM3+dDYHL1NZQGyPfkqp80L2WMi62UwKJ+zV/iaruF9z8EcHpwr0lOAvPPuT1
 a7pQ==
X-Gm-Message-State: AOAM532THzd9Jq/tgxMCm47W+gpXcWENLy4Rtq/aa8vMguowjX6x/KSy
 YCSUT0/WGmEZIVHtIYvuNs6d1kkFtubefK2eyXE=
X-Google-Smtp-Source: ABdhPJx8QgM9bN4Uq0tmvV5svPS+Z8nWgUa2hYgaxYeKj2MVtNlhe96O4xXkIR714oJMYujtWcbzVeYmOzCKbmukwXk=
X-Received: by 2002:a50:ec08:: with SMTP id g8mr5484634edr.98.1625217588288;
 Fri, 02 Jul 2021 02:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
 <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
 <162518776607.3570193.14348711594242395887@swboyd.mtv.corp.google.com>
In-Reply-To: <162518776607.3570193.14348711594242395887@swboyd.mtv.corp.google.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 2 Jul 2021 11:19:37 +0200
Message-ID: <CAFBinCAASQUB=cg5EFsBQ4jd3TvcCJzV1=sYJci4ibR7FjRcww@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
To: Stephen Boyd <sboyd@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_021951_879193_C02E1C21 
X-CRM114-Status: GOOD (  12.96  )
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

Hi Stephen,

On Fri, Jul 2, 2021 at 3:02 AM Stephen Boyd <sboyd@kernel.org> wrote:
[...]
> My guess is that we have drivers copying the clk_ops from the
> divider_ops structure and so they are copying over round_rate but not
> determine_rate.
I just learned something new - thanks for investigating this as well!

$ git grep "clk_divider_ops\.round_rate" drivers/
drivers/clk/bcm/clk-bcm2835.c:  return clk_divider_ops.round_rate(hw,
rate, parent_rate);
drivers/clk/clk-stm32f4.c:      return clk_divider_ops.round_rate(hw,
rate, prate);
drivers/clk/clk-stm32h7.c:      return clk_divider_ops.round_rate(hw,
rate, prate);
drivers/clk/clk-stm32mp1.c:             req->rate =
clk_divider_ops.round_rate(hw, req->rate, &best_parent_rate);
drivers/clk/imx/clk-divider-gate.c:     return
clk_divider_ops.round_rate(hw, rate, prate);
$ git grep "clk_divider_ro_ops\.round_rate" drivers/
$

Changing these over to use clk_divider_ops.determine_rate doesn't seem too hard.
The part that I am not sure about is how to organize the patches.
1) amend the changes to all relevant drivers (from above) to this patch
2) multiple patches:
- adding .determine_rate to the default divider ops (but not removing
.round_rate)
- a single patch for each relevant driver (from above)
- removing .round_rate from the default divider ops

Another approach is to first create clk_divider_determine_rate() (as
done here) and export it.
Then I could have one individual patch for each relevant driver (from
above) to use:
  .determine_rate = clk_divider_determine_rate,
Then finally I could remove clk_divider_round_rate() and switch over
the default divider ops to .determine_rate as well.

Which way do you prefer?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
