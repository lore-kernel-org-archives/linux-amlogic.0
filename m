Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145D9C3DA64
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcbEG5WJRjJinUCfDlXY2joF88vXqWxCoehtwK036q0=; b=ZHNRVxKU0zGs4P
	lRQg4KLnr8CYh9M+I1aHjduaQkguBF9Hl5FqYmvMNMHjK+GR8/Jqb+i3SGw/SxJjXurwWzf10/NQW
	ahMoesIqu4lANh+sE8/nN0/MTdxijtcD5MK8yE0U+2Kv4At5k9kUjNHlKBUa7/d9635drvCqWTurg
	yZiKHWbRJhD2BpeR71Nk4QifJl7+1DKF56gez3KvfZXyLoPEheDETpNbN1FksGxAVCWpinbmkeldo
	0HDfdz8KNda7LgDRAoNphJt/reFfY9GAJ8dmpn788K6n3oeLvR4S0ADHe3ZB4gyQNoSxW94jxLA1n
	RJF7kcRWdVo6wcbhqy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbE8h-00000000ivx-3Gwy;
	Tue, 06 Aug 2024 06:57:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbE8d-00000000ivA-0ens;
	Tue, 06 Aug 2024 06:57:46 +0000
Date: Tue, 6 Aug 2024 08:57:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722927461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=62j0r8NgTpks8O2+mQwJWIgoNQHaq1WhltO5raRF02k=;
	b=cJRRVkgBGdGhodNNKTBJlbcd6CZrAkA/ofmdaQEfsMZAYKUC2t6laHW3ecwbsZYsFCkjf2
	34NutzNm4wtBFruN1N/CaUOqAJVkcorfbh7KLq9O+wButW4dCGbS+Pm+dpqnYVhnU7CcKH
	Xu7lftAhyAixgFQgNUz0otmYznlLcuO6szm1IxiNQ7CLQdg/mFfRhVCTG91PjDcYfObYyF
	wVnB2WwvbJMyAvNcERY9GkyHzIeC6CAk1vmGaMiCeZAJNws74jPchsjxbw/c/DJIPpQASm
	gMtijUgKIMSgRg0gfH2PAro4Eo1bHCZVngsmOhRxVPQ2k424eg37xaWoTEAScg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722927461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=62j0r8NgTpks8O2+mQwJWIgoNQHaq1WhltO5raRF02k=;
	b=QDiaKIxvidaD49LuxspxsysRalmPj+QyVKlprtlmK9xpaznAzA3Asj/riap4hJk0L+Ls7X
	kFkI1mah3UN8YyCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-rt-users@vger.kernel.org,
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
Message-ID: <20240806065740.DAZwSnQ7@linutronix.de>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
 <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
 <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
 <20240805153309.k_SfHw62@linutronix.de>
 <04b2b8c5-8b18-4594-9eeb-9971d8cf3786@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04b2b8c5-8b18-4594-9eeb-9971d8cf3786@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_235743_359295_B5CBAA7E 
X-CRM114-Status: GOOD (  15.77  )
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

On 2024-08-05 17:56:22 [+0100], Mark Brown wrote:
> On Mon, Aug 05, 2024 at 05:33:09PM +0200, Sebastian Andrzej Siewior wrote:
> 
> > I'm not sure if making the lock a raw_spinlock_t solves all the
> > problems. The regmap is regmap_mmio so direct memory-access and looks
> > simple enough to do so. In regmap_mmio_write() I see clk_enable() and
> > and this uses a spinlock_t so we should be back at the same problem.
> 
> The clk_enable() is optional, users simply shouldn't use the internal
> clock management with devices that it'll cause problems for.
> 
> > There might be an additional problem if reg-caching is enabled.
> 
> The flat cache is there mostly for the benefit of things accessed from
> interrupt context, it guarantees to never do any allocations and doesn't
> lock.  You can also use other caches if you ensure that any registers
> accessed in interrupt context are already cached so won't trigger any
> new allocations.

My point is simply that those two things could complicate things further
if the desired fix is to (always) use raw_spinlock_t.

Sebastian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
