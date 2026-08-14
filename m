Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B809C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oBJwRP7DPda72xN6lmf83undmo1fwrrj8O7AMPtk8E=; b=3V3qFHLTd9hvWb
	LvJUbVUaWx3x0P5ntS7Z5TNPH5heJNpMOAlqLX9UDsDzbeVtVXYVw2Kcbu8atrxkzdQuP+LUZunsM
	4F11HQq7dLcZeME2tCrx4UFU2lSorq9vbKmZa1pXKEOjZKbohBPDZy/H4BJ03INNhvbxFe5cnFVj2
	dU4nG6VBUZxyLx/q5VVZ94Gm0e/v8lmrOeAyJajlXNVBv8ex6eP/fIHCMKnV9pP8KxpTyt9ZHdfDJ
	9LirHTVfq+7BVpzgtHJ4nLS43FqDu7ymQkE6MVt7DCmVAfFgD7QKmT2asXJ1GmVlh9+Rn0M4fiIkC
	zrazRvsSJcxed3Ajd35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq4n-00000002aYV-1yB7;
	Fri, 14 Aug 2026 11:27:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq4k-00000002aXl-3jhA
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 11:27:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49558ce01afso7154655e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 04:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786706868; x=1787311668; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=nmQPtw9+O6Cudrpi1VbhjWgle8ogkXx5EDZd7oP9cFQD6w6cW0VJ04AIt8II6Z2+er
         JWFz0N4xpEfOpBMX92TEzt17+5GUtO0sJgg2Bbw0AUFZv7ajsQpc01PeGZBzHSEILAmh
         rwwRrnF+KmOept90DgMToo7774PRDeptZWwBpZqs+zdl4o8I5LxOwQa9xaxdW2+NtI2J
         UNtcZpzsg9zTMVk6vXfU5KgKp5l99uSQQn6EzBaF+pG9VUt0ID4pQgGRCB00pJ9T1J4V
         WOX1tfNpXfzKN3NttStBIK6Un5nvDDNOYRRajd5kcl7IPL7AZaekOR64AS3rRHEJMu9/
         inOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706868; x=1787311668;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=Ju3kF7RvwXE6NYUQIFKCrPGC8aHYypnTBh22OhIp0zPkqX77V/TkB3HA0VQi3+2ETR
         g2ka2bWQklkoxT3g0StrxspxhNRNXWdMlHaNg+yFPh2m8tmstufudAM+Zr5WEi4BZ37m
         +jLVFXcC+9RO8qx/Yowm2pINzd+jj2d4Xx1sYlKIp4ih8gBYuaw5qnYn89lhUDLqEZk/
         ib4i1LO3rhvlolZjbbPJSC73uCvOqLtWZJjff7WlN6g5+9ltDmxVmBxfrlqm6zQM1yF6
         2wRq6DjeePUye0EGRFN/888p5Xapu3VhUC7UTa31gTXNSMGhJhosTtS3a9ZyckSENHb4
         vXjw==
X-Forwarded-Encrypted: i=1; AHgh+RrBQNu9iz+zdQsS/XVwx/5bzekR607vFUkEObThpTWAercrwGKeGxEa1VKBjBa/BmknnoDPLXm1QxK40dqm@lists.infradead.org
X-Gm-Message-State: AOJu0YwqwN7xqap5+bAWGhdOStnkcYv749ykSerMcKqzHEe4iinnvcOp
	qbZFpU0VLAtU7iMSdr+uZM4MmJsY10RfzpVZjGE4wco86QqlfRu8ZiCXg6W82EthoZA=
X-Gm-Gg: AR+sD13R2XWTe+r25ZR9LFRdXviL5iHQa8hgKbbth4f118V+0/xx1lztb0bNXVgCZro
	xH2p+FxSple3x7o9sDk4TRtMuouzQcyfTD4FulAajKgvzCpLAQN/CQe2ZgzMvzb0CJF0Ns/qLHV
	8AsdYOMUhaGokgg0gtOMm0t1uWtaQ0gqolVWX8cBB3NMtpi0Sj8H1nzml5HH/AITrwIu+JkgOe5
	pGCNBCIkKRUvYryKk15bj90V63646ft+GHjjRIKJLlkImqZBP58ym84qfaWqL8EjRQ+hkbwDvdq
	ZQIsh0vrLR31JMPHFg9wYAbUitykS4OOgE7ebSCq++N6FwUCUTyQb1l4XEWB6gKN1NBKnVE8ib4
	KWAOwAy9xwt/PGYYf+jRhNQ6OJRwueg96x8NS0HOqzGAJN/QhfUJojkuXgtX0YGGDVUKISkv/Xt
	eojzCUL82nTiOjdKjLW9W67R18c2s4KFiNxT8KNDW7Nuc+oW7tNq7YAuzfKd06FBzqeTsuRg==
X-Received: by 2002:a05:600c:500d:b0:499:86f5:9e33 with SMTP id 5b1f17b1804b1-499879bc10emr72416975e9.18.1786706868594;
        Fri, 14 Aug 2026 04:27:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899b5ad0sm22278775e9.4.2026.08.14.04.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:27:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: meson: aiu: Drop redundant probe error messages
In-Reply-To: <20260814094211.25151-1-phucduc.bui@gmail.com> (phucduc bui's
	message of "Fri, 14 Aug 2026 16:42:10 +0700")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:27:46 +0200
Message-ID: <1jjyptc571.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_042750_934223_C505A2AB 
X-CRM114-Status: UNSURE (   7.36  )
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
