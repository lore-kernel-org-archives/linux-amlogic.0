Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730BCC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 21:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osdLy2j3hi468FJ0CMaTzmRZOvAV/bkYGILJ/m67QKg=; b=v3+97b6Qgrnjtr
	Dw1vpe728ybzH6qA9V8izDw8KNc/5+e8CZv35YVK533bvfimBapaHbx17ueKnM4M+QBNRVjS/apX+
	V01/nrY3ugakT/ePmZ95EHrxQ4IFTS/wndBr3DnbVNTFHVmm9A4VpOCwotzx6ASSXbrx+SpGi41N2
	oHlE7zh5SUqTU+ie1/RHuY1r62rMmWAGUBxL7dsU1V7ssD+UciNwJ2a1xMLieE3RRL/2casgXIZzd
	afZkdup5OVxrjjq/et/EwVVruvFVRbZTFUHDlFd8aeGrAhiBpiSoCgC2zc8xKJhRyzlb0/3gDTzWy
	vue3+gz+Da/ymA8w64XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpvV-007yQ5-1E; Mon, 13 Mar 2023 21:41:53 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpvR-007yO0-PK
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 21:41:51 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id z83so9526213ybb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
        b=ewNFuqtOOszcIZvcI5yPiv2kkPkqnkbjivc3Lmd7hRnbBZpJOOcYEFwl9/4OzNK3mS
         LXb8fMYAdck8g1a9Ydd7PktnE6eIoS3G2tdtgwxq1URvRoQJ2CrxoVmfwm0SWcRIA5Dx
         TxBU6ePI814d8Lw+Xk2jXCuphm6VoXdhGgRGDhYtyuGQKrVAp5kxf8QiN3ohzK6Zadvx
         eiTbBJiTE/QKnLClSp4icth9JKYi3aIQuQBqPbClatA9mNqh0BftkQvRkNTgPOjiBut1
         szUogmoXIWqurNnj98S4tkowYAN9Wl5PRfjNE+FeB4AL6nc3OxDiVD/XjrynSCJVdTSs
         2hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
        b=nS1bOjit0/C4EcVj9mEsT6p+rh/uBblgIgZrCYfYFBqmRtm8fj3VfSJWzSCVyK3obs
         6flBQx15u1OfiTXMoB8ukorAtXNSlOPkgPuuVFuPlYlKV1jC8XhRvRnGTMMqJl7L3ZEN
         8I3kfrdcnSFdqXzaRsjaTZT48vOEDm3cTYamrSKCCwvSJyPDI7nKbgl2exqB7gxwoEa8
         ZkqSm1KyqeOaV5cwoeJdRZhpmEwKBbfji3e0cMB92NG9qDCWlkjtu5+R8XlwQ3C5lzp3
         wEnIVRNOy/NxxHcnIFriUEUmNrXLNCvETLvYVitxoGGosFoRRBbhtch76IWJbghUsHPl
         I/KQ==
X-Gm-Message-State: AO0yUKXhYEQ+rfPxnU7bTs71ZMfVB1d9wvxy3uA0/jA1Z6ADWqcZeVwD
	fadOIro7eIgEgRm1Dvm5JJLgdrIcIdXAw+c/ZMiePg==
X-Google-Smtp-Source: AK7set+R+YI9Nnas+5qiv6+jEi0Hs0zRL5Bqz75GQxapnR9lrv+JhLm/gXYEZWElQkVJe81BR8KBAxDNduDAH7eUSZY=
X-Received: by 2002:a5b:c48:0:b0:b1a:64ba:9cac with SMTP id
 d8-20020a5b0c48000000b00b1a64ba9cacmr3361726ybr.4.1678743706748; Mon, 13 Mar
 2023 14:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de> <20230313155138.20584-26-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-26-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:41:34 +0100
Message-ID: <CACRpkdYDpvpvURPCsdAMEd6s4_uU3UCpWoVLYkM8jh+wBM0ACg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/pl111: Use GEM DMA fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_144149_854941_12EAE8FF 
X-CRM114-Status: UNSURE (   6.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgNDo1MeKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToKCj4gVXNlIHRoZSBmYmRldiBlbXVsYXRpb24gdGhhdCBp
cyBvcHRpbWl6ZWQgZm9yIERNQSBoZWxwZXJzLiBBdm9pZHMKPiBwb3NzaWJsZSBzaGFkb3cgYnVm
ZmVyaW5nIGFuZCBtYWtlcyB0aGUgY29kZSBzaW1wbGVyLgo+Cj4gUmVwb3J0ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9kcmktZGV2ZWwvQ0FDUnBrZGF3U1FzTnFLSmtTU29TdzNIbU1IeU5YRlV5d3hr
ZHN6cFRDLWFfdVpBK3RRQG1haWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
