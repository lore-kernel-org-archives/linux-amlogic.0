Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4267AC00140
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Aug 2022 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmm8ZIE7J79ApyD4BYohKunwCiWFWKKWVysZZhQVn60=; b=J4TTw7FMKZ9Xxn
	QC9+5rIHgq1wcvGrQhC17yDWP/TgLoN6yxq4AoCA+MHbLkRgQ0rHkK9KLrvJGb+Ecxil0jhXA6LWo
	8LWIh+CK8g8BArTQWguJ9r8N1+Rgp/0xYz6pqDFNVznUaZa0K/QiWND+mvSZvtbq/Ryy8VnEvnhL9
	uDRpYq7g+7qkzzVmT/9QaFp2ZZTO4tn9SZM1yYGI2fpfHkR6ak+vi4us/SWFLyYmUejZGSEMCjnWL
	3bsaaGt/EJW/z8DQ4qlXyvVqdVi0QkOGG/oS6acMzBvtP3NbB56NpuffPhY17phWGsl7/jVkOuI4K
	pkKiR0naClEsgOXq0zyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPnZo-00CFij-Gc; Sun, 21 Aug 2022 16:13:28 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPnZl-00CFgu-Kc; Sun, 21 Aug 2022 16:13:26 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3321c2a8d4cso235215217b3.5;
        Sun, 21 Aug 2022 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4jWg3pa8oTEiXPQ4lpu76iaATY92QDHZb7IidOt0SyI=;
        b=Hyw9U2ZJCY3p7yK7rox0xxNjkaiTWB1F5GdXRAPnPf2MWoFkGV6ORCHDkO1941iuSO
         +/PnnYHK4rHyGhNkl/nJRgpcFb3KvTnGapYMU1YUOuZFrv8qA3fWIMMKf3kTaAhrPA25
         auDQ2JtJP6oEcHceFMLGuuGg9zKj72qg7b4gMfo6u45suzU/ocu4ZR+trx63fBK7VCI3
         K5WHgDi13KbTv61zvYAPbtJ9oxrhQhMBmBge6ZuxZuwzkJHv8tB+U0XtezStcgVSc5+3
         YokCyHA/0qKvkvmLNKNB7L3S+Ht7xUi89861BIianntbkHP69pFUWsYoHLhFNhz9aIWv
         uWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4jWg3pa8oTEiXPQ4lpu76iaATY92QDHZb7IidOt0SyI=;
        b=GGzxqmO9QVrkDjtcT+K2/KEhoRUZd82UtxlMLs3xA81K9R4xeXO5q9YoX0SpJKxV24
         ZgkC2dFOVC1uhv2AVaHPAfToLpJs9bKsib5dqAf9XQptPibpH+kjrziZwKa2KQhNeaik
         JMeplJVGdTgPz6f3wTtmgfPwGNmKoaYi5xrui9yF5inUZcmF8IB6V2Y77iF9X3veTscz
         wiDvc9XYOO69QUoHvu0+y8uFQxDZeVsHh8rroVlU8nS8ALc7cxE1rivLBBtMDoJkfi4u
         RH+ed/RQERF3y8HaCH186ld20lf9TLQ1p1A11DIXo7oRQy9paS0Nc6enl7BLbaNjl4Kv
         N3yQ==
X-Gm-Message-State: ACgBeo2vobP/f1OFxSjQYk30UYYjAu5XvCpeB++caaIKlNs41oaEA2H7
	XiVOL2iog6ms2XW8RjjEW4mLHQ6H3Ira04QR+vbBRp7T
X-Google-Smtp-Source: AA6agR6p921NJbFG9woz8lz8NnF5oqa7HuAlDjs784eoChdosYBnVJWRG9lGJIGcdKLbM+FeEsFNg0dcrrNBcmMPAqE=
X-Received: by 2002:a81:d543:0:b0:325:2240:ce5 with SMTP id
 l3-20020a81d543000000b0032522400ce5mr16442058ywj.210.1661098404182; Sun, 21
 Aug 2022 09:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220821153546.7358-1-wangjianli@cdjrlc.com>
In-Reply-To: <20220821153546.7358-1-wangjianli@cdjrlc.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Aug 2022 18:13:13 +0200
Message-ID: <CAFBinCCb-t2+F=EFBYc6QhPa8bL8SaXDcUBAQbW+WE9P0N=cHg@mail.gmail.com>
Subject: Re: [PATCH] clk/meson: fix repeated words in comments
To: wangjianli <wangjianli@cdjrlc.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, narmstrong@baylibre.com, jbrunet@baylibre.com, 
	mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_091325_727304_4574A107 
X-CRM114-Status: UNSURE (   8.53  )
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

Hello,

On Sun, Aug 21, 2022 at 5:37 PM wangjianli <wangjianli@cdjrlc.com> wrote:
>
>  Delete the redundant word 'by'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  arch/x86/tools/relocs.c        | 2 +-
>  drivers/clk/meson/clk-regmap.h | 2 +-
The clk-regmap.h change is fine but it needs to be separated from the
x86 change.
Can you please send an updated patch?


Thank you and best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
