Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6780DFA373D
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9Cch5Gk7NAKbFshKMtS3RYad/GupRVAdaaRcLb2WR8=; b=dvS8iyaN5LfRQ2
	lrOsoiSy6WEgUNATKyXACkwdWbQJ39Z//LWqZh1NtPH3yKEc5Xnyco2qvC/ReYlogzs+I0clUTfLs
	02FLyB6PZ1UROysssXCeUHeSwW2PcRcxhZy0D8QrLnc1zdMUYhlrdu20mVnuwSMRsz1cBVNjWkYJK
	fzkupk43kB/6dhJ2o4ST8HgwSi0UV0qKLN7rm/99Mr53TcuUFHQSM1Jn7fLIsgW2ihKHp2tC930d5
	p9AVM9btcJaIxrG4vP33bgjo9lTQYJMYZCToEb5PlbOgBq66TJBrDm4LHHDDa5eIj2ocahCknVSSD
	ZpyVL1CTz30o4gorJMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olviF-009AGU-0x; Fri, 21 Oct 2022 17:21:39 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olviC-009AFW-3E; Fri, 21 Oct 2022 17:21:37 +0000
Received: by mail-oi1-x231.google.com with SMTP id y67so3976451oiy.1;
        Fri, 21 Oct 2022 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6BqgqIxQ+q3oABy/KVS7FxTx0acwuSVWX67BzMj1gk=;
        b=f0nVmiNw0x2GGqQ57S0MHq3NjFd8sUe5YLfcPOwspvxvypgP+cCpLhpNjPq6N6+CXP
         +Q0C/RoViUG+lyDIum7B7rwHu9/lqryapUDDBwzENKf051uyNXPT1Eu9fIgFQ1VFbqZf
         6XkDVmSa9qwO0qiTxQaAgB+yJfoRh3noPTlNLizvy6WRHLxedoEXqVuTmx9ic2Ccaegy
         HI0Xci1CnQUW7bVAVDIttvYeUfCyCf1jH5un9YxdPJlISULB2whXDSj9SPZRlE5Yolgh
         tBAxGNaVZir22XaGDM8po83dHjz7yWQrhde0v7cPOVIvfPX54xGmHI+f6cYmRTkphONF
         KyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6BqgqIxQ+q3oABy/KVS7FxTx0acwuSVWX67BzMj1gk=;
        b=HA9scAeu4b/nonvz0oqMzJR+u7pk0pcycqcgXwReaRnl5SI0XaGVaok/SJTRmjAwfy
         mhyp70McbkSkrXKq+UbY0rx/4KPj0SekAy28etcg5zNXo65As9xlvPu3CvnbmAPbxz2v
         fseuIt14SIncC2H+3I7DHzMe0TiMrNqhFLPNmdspxxq54gfI2Ub3/LOkBOFmkyHBcRvm
         gORuYOA0vZcijSYd29U2Z9/OOfmUCWlN97mWLy9QdtHrFsFMBusrMjsahFZYLgp+1UQz
         mVESllD4TQQoyUDvRoTMTt8D5ByH5wn0zClSmSVpv86DyGBBodfc9oSfvFozF6J0Nzrw
         GhIw==
X-Gm-Message-State: ACrzQf393SKAczJAr5RW/4C9zfmK4VGBlHMZBZeFK2ag9j2RuujQi2SK
	TkEyAEGRrnZ5AZfySoivPT4=
X-Google-Smtp-Source: AMsMyM6MoqvyIyxliKOCqZiFkvP91AsjRQGjeNSwYlnxadYUwlrS7DJ88HFJP0uITquBRGXm8Nv8tQ==
X-Received: by 2002:a05:6808:1994:b0:354:d97e:d4aa with SMTP id bj20-20020a056808199400b00354d97ed4aamr23292247oib.148.1666372894339;
        Fri, 21 Oct 2022 10:21:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2-20020a05680809a200b00350a8b0637asm1305671oig.47.2022.10.21.10.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 10:21:33 -0700 (PDT)
Date: Fri, 21 Oct 2022 10:21:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 3/4] hwmon: lm90: simplify using
 devm_regulator_get_enable()
Message-ID: <20221021172132.GA1890681@roeck-us.net>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <a1fa4364cbb775de25478117dd22dda0742089e3.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1fa4364cbb775de25478117dd22dda0742089e3.1666357434.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_102136_184561_DA69B48B 
X-CRM114-Status: UNSURE (   8.47  )
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

On Fri, Oct 21, 2022 at 04:18:43PM +0300, Matti Vaittinen wrote:
> Drop open-coded pattern: 'devm_regulator_get(), regulator_enable(),
> add_action_or_reset(regulator_disable)' and use the
> devm_regulator_get_enable().
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to hwmon-next.

Thanks,
Guenter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
