Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C8FC54EE9
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Sep 2022 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCvwq/2Ke3tuBlgmuot1NwMOo3lpFQyf00nDii6mFRk=; b=JFw9XQAvXs38To
	xjUyjT4xzD8JMlYfn10UOXV6STQj2NPmYFUktbMqCK1bSMqNme15Zk0tG3naFPvp7WKb6pLTDW8kD
	9qITBw3XBFnjjljf76+S/U1rsC6SAp3I+7JFBSr+iCkanLlArGTohgRK7MLBIMGlyGbV/JbQcJcY+
	oieJbq/72psxfmBou3zQ6ZZ70jyMP45eERYU1sbEQHBzgTv72XbncHY4/j8m1RmdiwcOPXQCk6FYU
	Qqc+tUjrF1O8LbaRklQvV5bWBXkugt6Lqyx2YsVV96UOljD0th/vrc2ktjg+bTDyNefn91gXZzRD3
	20XtS2Q2mrHsqz9nxClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXb6-00DICP-SF; Tue, 06 Sep 2022 12:22:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXat-00DI3n-Ky
	for linux-amlogic@lists.infradead.org; Tue, 06 Sep 2022 12:22:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id c11so10954211wrp.11
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Sep 2022 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=etRB1TES3HElT9FZpWWrbjBF4Hgq+Rpw7WzQMwgRKNE=;
        b=kVixT+G6sAyrpaX+Jd8i/qmqWAcqP2A3HuzTN1EChZncqgmuKzSTWSFrblBcz5EAiM
         X2IPpyBmI5kXEr8xKlGZOTxMWGyzwC+hfNtVSNpBYqNniW26uQbY8zwFEFkMKLWrEsCu
         TZMJ7w0BXNIDIa453ocHAw1KTaoAcyvxFwZvE6Dnzr0o+kBE0C9mN8pZzOfGAm3vmfHZ
         4uMDGOnoS9liSq0upmAI6Of8riDPaOq3l1rN3o/nj2CBSSx79jH49JzB7XAVSvcAeJjx
         CseJy7IlPQ8siNDKZ6CasGBV4kcRhH+iosul04RbdS5Y0PEsEDagKQabqCQ13Sqe938P
         XoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=etRB1TES3HElT9FZpWWrbjBF4Hgq+Rpw7WzQMwgRKNE=;
        b=rSAHVE3sh2x16I51WhxdiNw53IDCVw7cGE214IoWb74Y8ziyR2arq1baY1wrd+wmh5
         IDFpLLmPM+PiC2a6hD1VvNNIWjdvjSaL7xgF4BOZy1yBu02DaTQXGWP3vsK46x6XKSBg
         +Dvnw/NZzsqvzrWltmjAYO+xc11Jw/gzDuevmKLCqm6DxAqPDa7ZQCjWxrRbzoQ0Xo+Y
         C+jV0GJ9LrqLqvue5HoPZkCwd2soX5atJ/ZAg78xAuKdsw1ArkG4NncCSA4vsGnRtXn/
         5nay88PGIa4izDmDHehcyV2ktNH5247+Dqf0hEYGOoMciBqEjsdW/wX7YxQONcsmbCnr
         NJGw==
X-Gm-Message-State: ACgBeo0N24VXIF8NtArl3eDVi9cyNLhMTSEDHsO6r1V9NSggZFJjFSm1
	SW/DTjZ3iYuw0op5st2msvpb6Q==
X-Google-Smtp-Source: AA6agR7cXoWdXaVb+PdspVN/tctRjn4oDvh3CI43TFmWbSs0DrYVCD8dkd/BVjD6tQpyPJhgsAmjjA==
X-Received: by 2002:a5d:5143:0:b0:226:de76:be7b with SMTP id u3-20020a5d5143000000b00226de76be7bmr22345327wrt.308.1662466935841;
        Tue, 06 Sep 2022 05:22:15 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003a3170a7af9sm15588545wmq.4.2022.09.06.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:22:15 -0700 (PDT)
References: <20220801092150.4449-1-pboos@baylibre.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philippe Boos <pboos@baylibre.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Neil
 Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, "open list:WATCHDOG DEVICE DRIVERS"
 <linux-watchdog@vger.kernel.org>, "moderated list:ARM/Amlogic Meson SoC
 support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic
 Meson SoC support" <linux-amlogic@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] watchdog: meson: keep running if already active
Date: Tue, 06 Sep 2022 14:21:26 +0200
In-reply-to: <20220801092150.4449-1-pboos@baylibre.com>
Message-ID: <1jsfl4wv4a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_052219_724441_D443C15C 
X-CRM114-Status: UNSURE (   8.75  )
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


On Mon 01 Aug 2022 at 11:21, Philippe Boos <pboos@baylibre.com> wrote:

> If the watchdog is already running (e.g.: started by bootloader) then
> the kernel driver should keep the watchdog active but the amlogic driver
> turns it off.
>
> Let the driver fix the clock rate if already active because we do not
> know the previous timebase value. To avoid unintentional resetting we
> temporarily set it to its maximum value.
>
> Then keep the enable bit if is was previously active.
>
> Signed-off-by: Philippe Boos <pboos@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
