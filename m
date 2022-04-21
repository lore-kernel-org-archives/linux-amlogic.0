Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1ADC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2wke/xHT1Zohgk8vvGpVjEgV4l2iWuq9+4RhG5hN9s=; b=oUaYaYokECyWyF
	EYOTHZ4zvKYb0jN7vADJRkDvPTUmTYc0HltXIHOHyCs+L7dq5FzkQMhMbK240w8FxUYK5aT+EFqDb
	jbDKtulyZSyeGeGo0p+9HWkmSNkWws8yF4OM1cC2ONioY+imn6h3QznCwld1ye3x/AtCDx97OmO1H
	bphFSu9Aj5BPW4Q4jYZsLYF4vNhen1qY1T6oBxLAvL3rKspZTaj+vCp4Jp30r9P3julYtk6S2eWIz
	EeXN6g710MSm6QVGqoxFLGQMvgkTOf0mSxj3MmANrNyEFouGV0Dp7+kFf+bbtRhS/g9/Usp6hOIFE
	gEQzCpzVxpz2YacJacrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZgM-00EEaI-Uu; Thu, 21 Apr 2022 16:29:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZg9-00EETm-R8
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 16:29:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id q20so3532655wmq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=vrEs/2pEILP9d1ISDp34/8wtCsJViJ6D/+Hs3vTnWsI=;
 b=kiRnNazcdTuefZZxff/Lv7MqYKxC82ka2qvvv0JcQaQ5eXgb3C1Td1A6Yjqd9oSHjW
 cMbnQC3KtAdteb6sdIvj+QXOwx4ornXjnKbeU5vSxw0jCC17VrGZfmOrM4sXwlVVndEH
 JPAKQS8ZxSqC6VQv1Z9KYKx9e6oAIIg3+US9C7QWCuam4Z+S244I7ecKXVgyO9+PsZvW
 esjoVzMxM+KA87KPOtThU5FRSN9h4WqEZXzc7y2IlFAi9oejv6HKiIsgCkuGcnDbUzeV
 qWmJ6gqtGwT9I3hN8m64D4R4cyImSkG161BjeGoRFRYFJOzDk+XHe3yAisQDlDb7PhdY
 Xa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=vrEs/2pEILP9d1ISDp34/8wtCsJViJ6D/+Hs3vTnWsI=;
 b=BLWdiyApK7EdO8xdxOuoQg1HEJ4zt1JNmMIgqZrQdyw2iPRIxNWRBehKKq2eVEWyN7
 6nq4DTZC5WEEp0pnXbxLxIQxOOqHH6dP6T0jR7mAViFjERXlvqvRwTjOKA4t+HE8sjhR
 p6SayXxlPRKHk8HJFrzzYwafTjLj7uV0JyQocCwqs7Cx2WaR/8mrsb+73/V+tJWxcVqW
 s20+rsk1TFCikdMyCUTLBMjvEDI8dYuT4a9cT8Gm8PApvju4ZmeR5Ryb1BhkjHckaeYq
 WHyqxCMhW3FO1vNiQojhbC/IUhTgjRP2AIi6eL0pive9nHSfRstPsl7ubZYoFqYoaLEG
 KATw==
X-Gm-Message-State: AOAM532uL6uVDF/S5WCEV2F+8SoWrsp4meNNN+vBS5aKFiKoan/rT9W5
 mft76K5ntjxmaieVbDKBVMF8dw==
X-Google-Smtp-Source: ABdhPJyQaNKtS9rLLBu7H6jeDjbWV36SMhQuTvDDlstfthSmDE74vKvCmC4ESH0lxl25edccn/nitw==
X-Received: by 2002:a05:600c:a06:b0:37b:fdd8:4f8 with SMTP id
 z6-20020a05600c0a0600b0037bfdd804f8mr9664089wmp.41.1650558550287; 
 Thu, 21 Apr 2022 09:29:10 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm2576235wmb.48.2022.04.21.09.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 09:29:09 -0700 (PDT)
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Dmitry
 Shmidt <dimitrysh@google.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Date: Thu, 21 Apr 2022 18:17:02 +0200
In-reply-to: <20220421155725.2589089-1-narmstrong@baylibre.com>
Message-ID: <1jwnfixuwc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_092913_934688_8F933BF7 
X-CRM114-Status: UNSURE (   8.69  )
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


On Thu 21 Apr 2022 at 17:57, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> causes the following system crash when using audio:
>  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282
>
> Reported-by: Dmitry Shmidt <dimitrysh@google.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

For both:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

The main reason for the this was to be able to configure the start order
between the DPCM Backend and Frontend. Only the trigger() callback has
that capability for now.

This HW require the BE to start before FE, otherwise channels get randomly
shifted in the output stream if there is more than 2 slots on the link,
mainly on the capture path.

This HW require mutexes to handle the TDM formatters (because it uses
the CCF API). This why I moved to non-atomic to use trigger(),
forgetting that doing so would make period_elapsed() take a mutex from
the IRQ ... :/

To properly fix this, I'll need to extend ASoC so the prepare() callback
BE/FE call order can also be configured.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
