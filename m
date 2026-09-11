Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A166CC88E53
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 19:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mC3id2GQi6GquH/in7L+D0nQg8DYT0X2BsLGu8JiFCQ=; b=3Qv/RuQdXcpQGn
	eHTfn32ztxshKbpedV4KanRJA7M36bxyHk1byO8A68kTEAuemOxb6cpqlgj1Eqt5w0TAx65+C/u5c
	CmlGbCesgLP0BIY1MxzVEvtzsXrg+ucimevcnlxBwHFUQGik5xo5D4dK3Hc5/umw555DdBL+5BEgJ
	Gpc+MKegMlCvAogWH4/humDq2Jl/svQDMha2KXLXiW7blrZHD8/ccidhOJ1QpUH6tJI+aAiJHkM2c
	A+udCDCSkbt/TcIB/t0H3PUAvcnaZ5ymYxQrt6hNKyCGaFzqsgRv0j5o6Bl3biuver6VeUsaG8efH
	UhCGPwowv16AQYZUQDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56ZE-0000000HVYz-0qK1;
	Fri, 11 Sep 2026 19:05:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56ZB-0000000HVYb-2aRW
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 19:05:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so10600625e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789153539; x=1789758339; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvEgCS4lnVZGuqvTEqApyi1EqjdLQ0vEhWKATFltbNs=;
        b=WX/AjSOL1f/yx63p/0IKbrKtmfxWKSiDRnTJvJOgsDlaawnyPkfHtHkWzeeFfF6ZIk
         ojCxaXUzpx7NN+bGdmHIGrsj9vMmmpeXy3Qb1d2niH7zVUgwRE9itSatHdzVgkjMP7Ux
         bZj54BClQvCD5dukgScyrf7YhcFjmw6RyJYPRHeUNOMW+yiXg1nURIAlQWEWuGEITfKO
         b2C4PVI8MmQ6PpBJ0vtPRaS9j9W3YA8chfGH5FBUwBSeQzsnMDqb8222G+dxHN6N+ed1
         MDbFzqtfBCisZp22JTiW1gkaR5tPbTYJ8/o7KNMwT1zGZc6HPA5uKqTY1Jt/qJ3It7T5
         4ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153539; x=1789758339;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvEgCS4lnVZGuqvTEqApyi1EqjdLQ0vEhWKATFltbNs=;
        b=XMZ580DhhUJIXCuwJkRd45yzWnyNndCG7Wqo6JhbL5ESXbyuum88WXClEUBAJIe+5+
         vfL2887UBH/8HGIZSAwzSZe4DEoqnXcvmakEbOF4EjpaS+RZ9gEYjNQ9rz615swg6zI0
         STJjPTcaGPiU1FkdAmrfWPquTeSRMPb3P7ghU2IYlMMto1LqTibAzon0KcRbSEOQVFU1
         ydMDrHZ+Xgv0EGW8s53EIDXMEGDPqVew1OfRDaquBJzZxUqyGDmw3VCbNXTsJUzRbIet
         1SJYt93Z+3sx42/yLrkzzm8VFXiGHSWVl/pyV9jRW31u5WbjKiUelB4futca+AgDP4nY
         B9Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxugOAopg6uBdMRP1TjKsEG0WaYyj6EvPDLhUP/wOW1V3dp3rfkGIVq14NlKZtKljg8RZdvUeAEJmDnf1mC@lists.infradead.org
X-Gm-Message-State: AFuF++lN3oeXzCjLm+yzr9ESnptqNlvaGm3I86ZD3IQD6u24KyMpYwBr
	SaUy6p8uo1YX5Ok3XT4va01jMHP4GG5V/2Dr15zO5OzD8/fr4gboIPHu3lUODHHibRQ=
X-Gm-Gg: AYBFou1gJI7oLTmzXiRzOaj4fTi4glDYd1DOZed1wnGa5DYrt6d86hX7GP3UBVZCrog
	USWSj5cnOndUvw3Zem4CW5kSh/BNUjhRdBItl1xFdeEKglJY6faIq+VQ93CvDtviuLnhPq3dbFp
	lrAS4jxzjFvJxQnhTvjds+2tNpOTz5RX/EIlstK/JRlqo1jAO0WW9noTx++BPyTsX7qIbylc2HI
	zCJUMsTYs1w5Wy7rG1jcZkAmOYWp8/NEEDkdlmrbNK9z1rSDXXDLEVpp6bSw312vESYvpbvrke0
	ZiaV5fkIKT3ad3O65Xbtski/j0Ndy3ls3VqJ0TF/sujtx0+m+X1Ff+zfmqDZAKRFWuAwCA1Z7kE
	q6qodXuL2HaBmxrN60D3JHqLPQWoUuKirHjVVfzHH+E3bRrNXLtZkKfwP3o5EeFcL7XR/L4EQxF
	0t/O98A4cz0fgrEVfMI3+8exuuXdBJvaISxo4ZLsLti7XT/XifXcZeD3Xv9NGwu80zyrguR307t
	IwSr57Esmn49rcI6w==
X-Received: by 2002:a05:600c:1c10:b0:49c:fc6c:be05 with SMTP id 5b1f17b1804b1-49e619f7187mr77391455e9.28.1789153539618;
        Fri, 11 Sep 2026 12:05:39 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm170999285e9.2.2026.09.11.12.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:05:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6.12.y] clk: meson: align gxbb_32k_clk_sel number of
 parents with actual count
In-Reply-To: <aqRAbyxpEnKlOXOu@laps>
References: <20260910072139.313775-1-jbrunet@baylibre.com>
 <daily-reply-0030-re-clk-meson-gxbb-6-12@kernel.org>
 <1jik4c6imt.fsf@starbuckisacylon.baylibre.com> <aqRAbyxpEnKlOXOu@laps>
Date: Fri, 11 Sep 2026 21:05:34 +0200
Message-ID: <1jfqzf7gn5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_120541_662738_B2B3EE1F 
X-CRM114-Status: GOOD (  11.37  )
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

On ven. 11 sept. 2026 at 13:54, Sasha Levin <sashal@kernel.org> wrote:

> On Fri, Sep 11, 2026 at 03:07:54PM +0200, Jerome Brunet wrote:
>>On ven. 11 sept. 2026 at 07:20, Sasha Levin <sashal@kernel.org> wrote:
>>
>>>> The following out-of-bounds read has been observed by Christian on a
>>>> GXBB WeTek Hub:
>>>
>>> Queued for 6.12, thanks.
>>
>>Hello Sasha,
>>
>>In those instance where exact same backport applies to multiple versions
>>how do you prefer to handle things ?
>>
>>* Just replying 5 times as I did ?
>>* Just reply once with a note explaining that it applies to other version ?
>
> Hey!
>
> Either works - so whatever is easier for you.
>
> Something along the lines of "[PATCH 6.18-6.1]" is what most folks use.

Noted. Thanks a lot

>
> -- 
> Thanks,
> Sasha
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
