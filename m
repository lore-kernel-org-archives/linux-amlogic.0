Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A22C52D6F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fH+8mOMrIqewMEO02OidV3+NEixuw6s3Sy67We12xME=; b=uJSKo61QHDBym9
	8xw0AmQ++XrOsy9UTOH73rEz/Ck5BX9uUaFYpi8csOYQOtqeQsbBY8cExd8TWQX8PBklQ+dz5Sl8I
	nzkkeqqJ3sHIMx+FxIm0M9uNMK98RKDQaWQf2CFA8Po65lefew9YuizMOC60fW/AyEiBLn8Pk4mDJ
	cljxmOLKlvMcZlAHrEujU7Vbw17WFTYqeEysR1hejxG5mEibzV8Sm2SV6nP5hAxuh3598+AscqfNA
	Aumrb1uhZvlQptdZmaJHtjRwf9MK1LiKzOGvL+Qyh1a0o7u2SlCNK61e1aaskScHFPK+Q+0nL9SHW
	s8euOLjtuxoKOwaFY53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbH27-00000001AU6-0tl1;
	Tue, 06 Aug 2024 10:03:11 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbH22-00000001ASS-0Nki;
	Tue, 06 Aug 2024 10:03:09 +0000
Date: Tue, 6 Aug 2024 12:03:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722938583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJrVNiSI/EhQvj7Rlw5xd+RbUJSrKucNzsEUSMrER3w=;
	b=Ye9wDXLyEG1YGrxeXzdM4wDn35Pm8HgIT2GMjREevsmZpjkH9w7d0u3V2FvVo29k9nE0l5
	mBQQKQMBDDGsevQuOX+zeBCn0aQ9pKkmagioEcsKOziMw9k76+KUqFULSrDNZO7qZ6IOER
	+4mQ9+erau+G6RKuqLIkL8EeWmjvujTIPD3pkgqIDxri0LRpIHpo8sQEE9GjhTBS+ZdthC
	dTYoD90oZ3U9CO5KJQVJNuCYtzDi9S93VK3Zaa26CTHPNNxZehk8y32JOQphwLvsz1Q+OT
	7ZaVF7gguZFRf8/q4MXbXGb6xMGKh34kVBx9T0gL2xynnrmmEYWiRtMXXsbvWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722938583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJrVNiSI/EhQvj7Rlw5xd+RbUJSrKucNzsEUSMrER3w=;
	b=YwVtx5h/onLbQ9kVaqP9fZ3ZiVEu5dYoPqDOBbRZWdoM5gDipsTsy0vAfbKrxprnSE32lz
	U0tbrXT2FbsBrgBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-rt-users@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, oxffffaa@gmail.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Message-ID: <20240806100302.Up0MShrZ@linutronix.de>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
 <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
 <20240806065021.PINvpze_@linutronix.de>
 <1jle1auhu9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jle1auhu9.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_030306_293008_59AF7093 
X-CRM114-Status: UNSURE (   7.39  )
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

On 2024-08-06 11:21:50 [+0200], Jerome Brunet wrote:
> I have tweaked #1 and added a few tags but the gist remains the same.
> I was going to add you under 'Suggested-by' but maybe putting you as the
> actual Author would be more appropriate. 
> 
> What do you prefer ?

Suggested-by is fine.

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
