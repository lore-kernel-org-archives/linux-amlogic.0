Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9E5CD37B2
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 May 2026 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9mQPOtMYkLVKY92kjv7uTdkp3yqYkAK3sG/46va3cg=; b=3NtczFuLsnm81R
	hTrrWn0SD/QYFial/4YgPxprWd17cixk2SjcHF8sg5EN6oojU++oFWR3bePRkvVHMpkawl4r5QZjR
	w8UpdK5GGCiapO/yvdkZXmR6/pRbxMf/8prgQZnJisrZpsTCWjcVz4U6er8q+337nd2gKPF4R2rCY
	k34KfvUczgs+L6RX/j7Pbs3WZJNPA5VIW83EpaGGVKVgxuJsfOEvQ+VqzZW+l4sC6f09qrPmLgsDT
	S71wlZNskEsD0XYXrY3x7PT4nCSI2U8f5qn3Ql0AxJ2kwuu2zAW7pyNnl8QrHyYBj1lEHZTJWO83j
	2HMLUZi+zY5uf+wxM7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSqn-0000000E6NS-1lwR;
	Mon, 11 May 2026 15:47:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSqi-0000000E6M0-3AWM
	for linux-amlogic@lists.infradead.org;
	Mon, 11 May 2026 15:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
	b=hYpSXSYdlsKgHbyipfhD0u1R6QU6GBi2fdj/ONCCjWZpIXla2I8TRx66UsQB/dI84zyEFI
	DwqWOGXQVUK6lfvvDMksUDSi0Kd3lO/LgbKfzpVDxzZmXsHEt914KOjqwoVZSF9axZY1IK
	nVlLFE1EsyHmhYtHPCyOg7Wr/t12+24=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-U6itg4ejPeeOgG7J5scyYQ-1; Mon, 11 May 2026 11:47:14 -0400
X-MC-Unique: U6itg4ejPeeOgG7J5scyYQ-1
X-Mimecast-MFC-AGG-ID: U6itg4ejPeeOgG7J5scyYQ_1778514433
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6326fc1256aso2163302137.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 May 2026 08:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514433; x=1779119233;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IaLCuwVBpxCwdbLTEf7IYx3z7POJtFUK4DUpOB/PfG8=;
        b=dOHb2Bp7vBs0r30w3ezwPw50o1+6QiDmvByvJUWZU5GngkCEizptrvR/4+O0svL8Wy
         GbKiDvwcSvAfq6Wh9E0mlAzuGaQoTAk4fF03N/jdc4VBlRWJ+bNqxS3yfacCbxpeYjRm
         xj9pzAwoJ+j5ETCIl3gHbP0ieyuDhSS1NNzwaWksYvxFRV0+BMmp4EuGzcFqVVg4JelI
         3EAxOzcrCKkCj3YVCG8+cKohbgppCfHVYZRfLk5LJLyIjvi/yRMOVuG2v/1NBYwFUISt
         7xbZSD2qBJfT03Hph61W8ntY5PpokEzhRTB5BnmNHpzeGjoextd7Sn/IuX39LqnXiTHc
         oG9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/t/FduWzp2MDfn5ya+Wthmy1PWv/z1OTHW+KU9nuT34TfjJWd8+MeOasWUVyg7mhb6b3+BzHl44oFoBIg1@lists.infradead.org
X-Gm-Message-State: AOJu0YxSBzQ9UrQiIqDeIp1K3o3xoXmPks9BTn2YPlUyu+3NmNZs7Z7u
	Tz1dgj20ZKW55ddlvAJarDvTeAkajfx3WUjP0UCLZmLtPlgXiFfP+xZsi06LwnLsZ/nfei1BTvR
	7HtV5oMZ02HvNSUdgcN5lNsra0sS5hUzz9KrDD6levhH6dNbhwVZLoH8ADCrtJQew0cdsHDf0
X-Gm-Gg: Acq92OF6ZQw+VcVrkm6e7trVJOs99a32nVHbkmF2BzkFLIibdGzEnflnrdIf/cFwW7R
	fej5+FOAak6Bj2FBxGJBePkQySQbmYLgmwFgy0Z6iSGaY7fRxiTfOjTw0VbnrGLaJVz+zbxseWz
	7J9DJ/R8L/Juo+wyH98f9nw24kZm9aGp/W/CO/+XSFHWhoTCA5knJ3tsTgUHqOzGV32qp8S7hVu
	df7dMB05caLnSFFORBfS7Zq3SpA8BVQpGVIScpqnPpH4LVvdLJU0D6M0JbZwprsAxe8cDcZy3rG
	PgdpV37SvL4p487c32ve6zlDBbZ48ytw9VVmr+LdeJx/iP/BOfkAis+gtbNeTzovdRmSVMjc6Id
	ElInNPAkpnldI3DaTJo79WPgAO3FhgWq++R15NdC8AzMZxsd3jfZNbUjMRfAtiETwUwI=
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546438137.12.1778514433507;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
X-Received: by 2002:a67:e704:0:b0:610:db51:6f3d with SMTP id ada2fe7eead31-631da02a2ffmr4546395137.12.1778514433109;
        Mon, 11 May 2026 08:47:13 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c4c9dsm101224006d6.5.2026.05.11.08.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:47:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:47:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
Message-ID: <agH5_mWD0CRIcGyS@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v-N_LqbmzEfRUoSWi6lLvaryxrBEwFlfFylSvrcwXho_1778514433
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084717_053244_4E262590 
X-CRM114-Status: UNSURE (   7.79  )
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

On Mon, May 11, 2026 at 08:47:27PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> l_detect controls the enable/disable of the PLL lock-detect module.
> 
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
> 
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
