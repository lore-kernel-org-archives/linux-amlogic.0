Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A4AC25B79
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVGk7aVSqNqzKTrXlH379pM2buVXJxSVs/MzIvDBtxI=; b=MRkV0TTTZY1SkR
	JDAscH7z8ZlFliYU4uPYTB0dRbvF9rPTesbWPYQQQVum62gBC1GK9aeG/4Zgx4pr5yL010iA+bNAV
	g2YPUhmimqYfyAbugN2ZI+O0ikRbWMnYqDAw5Xso3K/ylfarJj1BuXhG2uEc5O0EvIYM8/OOUlZ2V
	RKKrhaB0qbJ64MgtWDJVCBjVtzMzZsZ3y4q5xa3l8lxn29XwDqUh/AKWpA/03ejDfXvHGdqD8BglB
	MDRDordu+JJCbPedMLUH6kYHaRsCbeQjwQNzmLZmJPr1fpkKSnSKW9cTqfqSDMduUc2czr4FPzf8H
	p/ocuhsjc+VYTKpIm9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7EHw-00000001a16-3uIH;
	Wed, 15 May 2024 13:03:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7EHt-00000001Zyo-1JUo
	for linux-amlogic@lists.infradead.org;
	Wed, 15 May 2024 13:03:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-420104e5336so25514875e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2024 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715778194; x=1716382994; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=vlvP4Aa3+nQGmGgcIFiojH5cc2twOueCv7IOqtUVD84=;
        b=l6zIP4ZcKP+pCz0KvPuuMmdNj9yA1wtQwuL4u/BxTDFUGY1nzCvhAXNwhttI8sTvfD
         2daJ7ydgPVcnfc1N8QGeUk8rk9W8rhqv80SrBLSQC3MLhVbkZ2rIkvW4tQkJ5XkYF0m6
         kYdg8JEgwtf9vW7FlxBI1m+zsq5F6IdVHVaE+70xWp+eM4d28wb6M8MDZUdBelX7UdfG
         +IWcnnAmxxm2/cm6BCHlUKEv/FiUzvLsZKIKPpK1BX8MYikZsqXt43yTdUiy7CLdIjbO
         HiRVCAKZrKjmgSoHB4cUMh5wuRqOhslMzsJfZBk18e0ifBKELWrJ2b6P+BrPUibZ60an
         tB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715778194; x=1716382994;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlvP4Aa3+nQGmGgcIFiojH5cc2twOueCv7IOqtUVD84=;
        b=OSzq4n9WeWn9IK5IL/QE8yxLcz0G5OHQ3AcQMcPxqRQJR6duYttWZxvsJboKTjQVrU
         Zd3gMrEQXNIN1C8Q5+4tKd0V1tamomgjzqWhek6NLvnB0vKhXRLEUw4vAttQK3CvtXIl
         u20qwltWHJStr4jLEFvytPJEwm3w2YgoNbCaLXG+YDbbXEbub7PvsM9DqQs12z1AfPBN
         cEcFYkWaZZpFiCcsrXUbNB9vNz7BcI85zsKm8MWGXCbMUkFODY3z8esH711kdFZdxv2D
         8hvffH16x8Uk3CLDEEUjzeMP0QD26eLvdrU6+MtSKWJC7Fxnef+n8XI4xj1qvcDaP5ZP
         Loxg==
X-Forwarded-Encrypted: i=1; AJvYcCV7n6TQQ8A690xCXxSplE/ZxuHcGTrEUFa7IO6975O+gPCFaZy0g7mDJSFFr7lvB7OJy0zpPFuaWIFgCdj2e7bH/BIHpHV7i4+geKVEKuxM2DY=
X-Gm-Message-State: AOJu0YxcjDyy3jUUlTKNahqnpqJbjv0FFwU4WoLMUh2v8DbCq0mQD1zK
	h+ZlB4NQI+X0dKvz4L82JRA8fE4iD3+VqqZfhIdcbhYl78W78QicS2OCORU6LsY=
X-Google-Smtp-Source: AGHT+IFd1u7hHWUOgkLnsccx8x9MoqmA5KeoD0+FaBvMmlYandqrEjUD4CsLZc7fApcCVFV1xfjlyg==
X-Received: by 2002:a05:600c:4f06:b0:418:2981:c70f with SMTP id 5b1f17b1804b1-41fbcfb8473mr168925435e9.19.1715778194502;
        Wed, 15 May 2024 06:03:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2893:1a8f:5988:776a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe9011sm232644255e9.7.2024.05.15.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:03:13 -0700 (PDT)
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
 <20240514143116.3824376-1-jbrunet@baylibre.com>
 <46daae9b-10dc-4f49-8a25-c387d03ae87a@sirena.org.uk>
 <87seyk2dmh.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC] ASoC: amlogic: do not use dpcm_playback/capture flags
Date: Wed, 15 May 2024 15:01:35 +0200
In-reply-to: <87seyk2dmh.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jpltnxm5r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_060317_489026_7BF2E148 
X-CRM114-Status: GOOD (  14.58  )
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


On Tue 14 May 2024 at 23:11, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi
>
>> > dpcm_playback/capture flags are being deprecated in ASoC.
>> > Use playback/capture_only flags instead
>> > 
>> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > ---
>> > 
>> > Following Kuninori's series, dpcm_playback/capture will be ignored.
>> > However, properly disabling stream direction is important for Amlogic
>> > audio drivers.
>> > 
>> > I'm not too sure how this should be applied to avoid breaking bisect,
>> > before or after Kuninori's series. Maybe it should be merged into it ?
>> 
>> Probably better to integrate it I think?
>
> ASoC needs dpcm_xxx flag *before* my patch.
> Your patch is replacing it to xxx_only flag, so it should be applied
> *after* my patch. So integrate/merge is good idea, I think.

Ok. Then I guess it is up to you and Mark.
Please let me know if you need me for anything.

Cheers

>
> Thank you for your help !!
>
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
