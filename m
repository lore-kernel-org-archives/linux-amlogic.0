Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC56C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTM30v5J/RshEOxlhEVfcV2HVUxIcWlulpzdfyfWxBw=; b=YYnoLVQbnQ7ReT
	BL00ZD8aQo8wR/JcxJwoAwa5vq5mIm2fH06RE/BnBoWIB39Uxf6CrxSz/FtVymNjHfRIkImLRspkA
	MiB7Upmccw8GQupsIH0ItpxfyMrkjeHgP3mXEUQiY2IkeJSWmuiOhFAqAtWyGZSK2YQz0qsz/SVfv
	Qi8CMIxQmHwtQsauMxPPolx3tc5+In2fYdNR18B8DME2sEOxAZj7faoDCd3P/eoTVS019Pr+1Z6/4
	oVxSUlTkI3l0xqxqKMr0Tw2sSLqtKSXVZL5hW89gaX96KRW/z6wggmdb0lxvYsFUdPfwt3BQGCzCm
	xwpXpZjvpJo5v+kz3bOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0orA-00EP04-Fa; Fri, 24 Dec 2021 17:59:52 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0oqw-00EOye-Tv; Fri, 24 Dec 2021 17:59:40 +0000
Received: by mail-ed1-x531.google.com with SMTP id w16so35730858edc.11;
 Fri, 24 Dec 2021 09:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hzi76JCO26dsz7ekYNjFVW3NuBR237n1CHgJUxqZU+A=;
 b=b8Z4+wBsyOH1INV0kGjzIH7Pk+jGDfbGXT+rp3j2vpTQvJ4EnrP9/Erdh9TlN/jXOt
 Lm3A5PYe1XMsvdubBwkE7gVXJ6+pBQtZD80PcAY+IlpLtGrbOZP5oVkoz5JHQY7WpoVd
 UqhXPe5FmVge6yj/zHUINjrXoDGR7498L62jiEAvGbAgsqN8OoBaSu9xyLVA+6pI8LMp
 +VfZKbNcYAVEITEmLuZgitJhCJzItJerd6Uoqx4TTVyxGYahdT4VlQh4GriBPekLqInM
 /9dhL6PRkyU9sl8PuCc29J9I5opN7+iJDrC8jpPZDplLziCcVHes7ZQ19LoBiFDUJMVZ
 06bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hzi76JCO26dsz7ekYNjFVW3NuBR237n1CHgJUxqZU+A=;
 b=iyhb+g5+T+AiRWhyiCO3N6wW8yjqvK9xmiyq8RaLFX8xdiB/5uVP9matKxA1yYp5bp
 Au7vEcm3aqpCKZ5Rxs+2Unh2gY4BVKNRBmE1y+35SVFKBVTuYt8qwRlnhdizH3BfdJIr
 Pgrq/2jvM6XhyC2P03NcvoV90fzflnS9Zsv5W8hCOYkrrcZx0y9OqmUUQpeADY1stDCE
 4Vk2DZcyScfUSIyxNYzEwoVPI8ktV/prETxxl+Q6p0zPk8cGemeIrzCjS/Xib/r4V1mc
 SMzoWaQ5hrFlsin49nO0gWFJVBsLoxx/Q4u2AJi0LESfrpbpcuA1u2H0PM3UhXHQf4f3
 CyYw==
X-Gm-Message-State: AOAM530b6oz/hoBnT0Bge6E0gMYlMfP/77AB9SzsQrtI/jntAlz3jJD7
 /vlxRIDzZzEGMJ8EmLvya11SboRqetlL66SMh2Q=
X-Google-Smtp-Source: ABdhPJw/WuhOWOstOo6ruXdlZ9UD9s3fq3GZGIP5QNwZiujNB+508lNa3IF+uXh2Mm1UtQFhPw9Rru69akfjKfvrIZE=
X-Received: by 2002:a50:eacb:: with SMTP id u11mr6725144edp.290.1640368777447; 
 Fri, 24 Dec 2021 09:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20211224072207.2521367-1-shunzhou.jiang@amlogic.com>
In-Reply-To: <20211224072207.2521367-1-shunzhou.jiang@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 Dec 2021 18:59:26 +0100
Message-ID: <CAFBinCCrpHoLCYMH8JMmdfoSx1004GcV1DrAvCbUwomB50ZBxA@mail.gmail.com>
Subject: Re: [PATCH] soc: s4: Add support for power domains controller
To: "Shunzhou.Jiang" <shunzhou.jiang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 jbrunet@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_095939_037890_1722C71F 
X-CRM114-Status: GOOD (  10.08  )
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

On Fri, Dec 24, 2021 at 8:22 AM Shunzhou.Jiang
<shunzhou.jiang@amlogic.com> wrote:
>
> Add support s4 Power controller. In s4, power control
> registers are in secure domain, and should be accessed by smc.
>
> Signed-off-by: Shunzhou.Jiang <shunzhou.jiang@amlogic.com>
(The same comment about the name as in the dt-bindings patch applies though)

I don't have a datasheet to validate any of this but in general the
code-change is looking fine.

The subject should be changed to "soc: amlogic: meson-secure-pwrc: Add
support for the S4 SoC" or similar so it follows the general schema we
use there (see the git history)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
