Return-Path: <SRS0=nfxB=E4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53643C63697
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 21:56:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34012078B
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 21:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AdRBFPup";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="o5oORT9C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F34012078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DlY9aivldxcsNJnEedU8kmKyOHZsFsRYI/FiMEq3Waw=; b=AdRBFPup5H1XHJLthoY0yCV4G
	D/8n3mE1lvF+kZovacjRZkwZR7MJBG2Eidz/E8QpzG+DYGKpkIIOWnT9+DKZ2WhRkJNzARMkWxAeE
	/eggJfR1LXMZl61YiJ0hcR0TXKSpSsaockgC+INrMZEZLJbmjqJPlU7DneqpXrQiPd4S03ZfCMKnR
	ln+qE00JDSyupVFsKu0h4tGyhzasarB6fRt5oiJYc1o1HfsrgMHxc6UBGAO7aUSjOio7bJcuRTZ9t
	ZXVeaDjwQhGsF1dBPKk1BRYclC5UKdZnah8FodJLX+6sljCd8an7ugFACs2NDlioZN1VmouJ/yaMl
	b/+nZc+mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgxKv-0007Bf-Rc; Sun, 22 Nov 2020 21:55:57 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgxKm-00079t-Dh; Sun, 22 Nov 2020 21:55:49 +0000
Received: by mail-ej1-x642.google.com with SMTP id 7so20640711ejm.0;
 Sun, 22 Nov 2020 13:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NglbjUg/AZr0OKAOaLT2UcZf0xk/vqD/qRJfSLaWvVE=;
 b=o5oORT9CjWoHe0l8ljN9fk2iM6wBRJ702OjZ5frGuSktu17e1p4/Krme2ijOP5UJpZ
 LK9kbaGXvqfwwhav2ILI9dwQZwt0UwvJ785EZ6dAJZU98xjmcJfj5uKisPy/xMg5HlTe
 7+JIVZo3zIV+6S/sR1+1RePvwz+KXilG65pBrnmdkFeU9cYamw2mwlOcCQ47dyamcwvP
 S6t60bqk+m4huHpGoPS4JQH/j9wqyvTJQF3WBm5MGYPUwTxPCihnLIqKVdpe/3JDnX5N
 +YRhvKun1alXweBqckz8zOoM2Bd3noJzALJ0gSt1kaXcpoaxiG/sArVpKJ/JAI/bA4PM
 22Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NglbjUg/AZr0OKAOaLT2UcZf0xk/vqD/qRJfSLaWvVE=;
 b=bXIP7JjrfM0BEA2Vplop6C5ZV0NWq8oVO2n2OLR0fclqydQcCcNpG0deSQzJhzvvpF
 JL8zQUobC7DxBJRP5MDFGiMCKasVpzSyLkbwLJWBnH8A2HeEGVPoH9L9VnnOWdQnf6VW
 8cIwmEJdVacm087QkIUbF5XeihGENE5AZcBfZwNvqbBaIY3ybl5m+2pm8pHajfC6DtG4
 F0p4BCDCnW1b3S+LgFS9n2hEJQVjXDIPlrgMmjuPVkLTk4FspMAVdrevEoOYl7wd9lly
 FKTaEoFPsz6LV3VMAREsublvXg/LLNZrC0L0Q2J7WRm02sLPjjCqLDPsUPDWr4wLntcl
 Hd7A==
X-Gm-Message-State: AOAM530fpt9rPiR14sGXd3QxZCcmlP7kiE9bM7rTzdxKx6TCCGObm4o8
 fNO4vw/C2StulO23mdL087nFYr4rDPiiC7KLKc8=
X-Google-Smtp-Source: ABdhPJzqvbKWp6V/2RVgyExg8QSPIjfWuWLg8UIZPsai9ug5Gk7t77urciW9g1x8tFey+54aK4TStfYxNHjRniuVt/E=
X-Received: by 2002:a17:906:c821:: with SMTP id
 dd1mr10384090ejb.216.1606082147377; 
 Sun, 22 Nov 2020 13:55:47 -0800 (PST)
MIME-Version: 1.0
References: <1605667700-16681-1-git-send-email-yejune.deng@gmail.com>
In-Reply-To: <1605667700-16681-1-git-send-email-yejune.deng@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 22 Nov 2020 22:55:36 +0100
Message-ID: <CAFBinCDYOutJ+kDuEP_9GkqjRo0=TLOHCdVnZwR5N=NZ4PmLyA@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: replace devm_reset_control_array_get()
To: Yejune Deng <yejune.deng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_165548_715974_E68DAA90 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 3:48 AM Yejune Deng <yejune.deng@gmail.com> wrote:
>
> devm_reset_control_array_get_exclusive() looks more readable
>
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
