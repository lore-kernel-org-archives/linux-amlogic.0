Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4424C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oBJwRP7DPda72xN6lmf83undmo1fwrrj8O7AMPtk8E=; b=CqtIFUXYKQ7eYN
	jkAbCIyvNxjjXJbw470Sr4VtpqN3tJGffsmbFybzEo9er+uX69xokt1LDSFqRyrP6HLlR0I4nSuZa
	g5XsBWXsTMguLG2dTGePxQBjWNgfTQSuIoW7xcEtocX1JCALArhis9KC4DDiajCvd/6+3EdpYOkhp
	kkK236ihAgXUr4KoJoAFD4LSqBazLIjkg5gzZ3fIpISFuQBsvaqWL1XMY3p/sAzedgQkhV0C2DXx3
	DM7NhUvq4bAAmYIPvXbrlMlpUUvmMRB85oPCQG313rsGpqy5sN4nrKtJVM83lE4wqk0/PnhwB0ljn
	e51Fr0QAXkbv21tgCq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq5W-00000002ah8-3b5X;
	Fri, 14 Aug 2026 11:28:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq5U-00000002ag6-0HDO
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 11:28:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so12471465e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786706914; x=1787311714; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=WuL07T+oPfta8y6TkD1xsp/hbh2N86ic/NmLaf4emG+k6HIRqiW6q7WeNMSwQUZ1ns
         wCvEc9FkhQxnwXM7Uj7X3asQIIoprIkuFay9tGxdxJp2uPHIpA2GV87ZXjA7nqcVnVWn
         At4lf3dhqs752a54NRZU/EeC57f3XKuEIh1c7Ky6K+HsR2XAk1BiQ0GWapxd8887MQ5O
         ZNa0LlxkU8+QxZuDvEi0Kh+Lum+Poxxe4EYwwnwNUwc6UkPuld/T0ys7QOdS+ePxKdoa
         TjL8QRrQFtyNysUWwoErxi66O25dCMAgS1py793DHaR1MsNtGGeBgT+8VsBRpaQr/4jV
         h7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706914; x=1787311714;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=N+6uL9Mtw3uIl2SK8XSDvtau6tjfCX0+pHw8bLwtI/8I0vQWm/3yPFrn8m+7v8Zrv2
         wZmKJ/u72POdZYHGSTUAv6xY8rbg316EDj+wZU4HNAilCGoU5/52gW+2DzK+ck9zb2Xs
         77lSn2Vi160JIgWCydUlmCCcEhWPa3wK9Er/WlAi5xAjHhIcMdm0Ph730eij/9+S5L8I
         4AIxYouKPiXngDsWXIPz9ImXPMdIHxSZJTTIgivsMyipbaGpF5gIm0VEHZo/7LIEndTU
         ZkBxYKhhAj/HSvXVt+i++veEL84HAG8QE5PJZuNLvk0r0ALFvrYBOJQMQ685XFk8/LrW
         G9pQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro19/hDPKvpITVWhD3LqzCJ6hJ9kHZmieTNxgVFViLFqLmmLk5p1sXOumeS3p49ZUTv3ZXBlMCqUnEy0a53@lists.infradead.org
X-Gm-Message-State: AOJu0YyioYObHtEuAlSOJklkjLP7186xYmdlnduXJDESoM8xZNF9fCI/
	ESxoMmozLAoolOOAPeq8Rvh4a+hILtRvOUXNh8gcDep4X2hkgc7yyOLGy5tEdLRqeUE=
X-Gm-Gg: AR+sD12Pe+UmiawDE6bPdhzMtlgiZwahU3PIA5dJsFcFSo7d7x6C0gtxnSakSGLwnJO
	8d1gF6xLRriRqJhrUrWitOeOWBAxISAc4K1Sodmda6yiHvEOMa8ZnXUFUOiufZNHNQSJ0cMy+Ga
	9eJPgXyK+m452nneuCXRTtcnrsDv8jwyLvFk7VbxAwPLCSEiu1rqfsp+LDVeJppZv2DRNMlE/yi
	gtAHbubZnUs38SFz9T19sn8wqDXKhexPmOHxoKb2CRpQIR39BTdttoJFlC2CsQ3NA/M6OfCmuet
	2VXakKLjk3Izz/OiY045YAawYGvw1qRp/b3k/taQN3IT6n30ewD64WdxOUycMo3uB75OznfbFRb
	dS4+Ose2M4LYRetJXEiPSlpW1D7CMnHGCRPzWzEH2B18lB7jocI0/2AObG7aMABiR+HHfe5JgdP
	ubGF/ln1tllNO+F3Z3cUTuR5EPwb0tBLf0g3fB9q7YGKuQSsSA7nDIh3hwueo=
X-Received: by 2002:a05:600c:4708:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-499879419bdmr54955745e9.4.1786706914115;
        Fri, 14 Aug 2026 04:28:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899753ccsm24626765e9.0.2026.08.14.04.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:28:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
In-Reply-To: <20260814094211.25151-2-phucduc.bui@gmail.com> (phucduc bui's
	message of "Fri, 14 Aug 2026 16:42:11 +0700")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
	<20260814094211.25151-2-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:28:32 +0200
Message-ID: <1jzeyplz4v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_042836_114591_1F99BD7E 
X-CRM114-Status: UNSURE (   7.56  )
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

On lun. 14 janv. 2008 at 11:42, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The functions called here don't log the error themselves, but the
> error is already reported deeper in the call chain, so the dev_err()
> calls are redundant and can be removed.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
