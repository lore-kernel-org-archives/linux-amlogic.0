Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9383AC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4SkxDc8HJOJCM6ymhP/Hm6eJ4YYyDrDY9FISIBIXSM=; b=2xGim5hyx4YyLa
	ahsYXOFaFlg8wTgxnNL7y0hRt9/7OOuMiv9t8BPgsS9XQbe+MGRiMf92UlrO1BtDQlZLbE9L8CStj
	2GPamfk7AUAwtgE6sCcusRygwGpYzEoerffyKhTJuhumYboIbxH8XjHISFoOEJ/MPHKgbUhm/7XgC
	RLNN9hqk3OlLO6pahAp8zV9crc4KlGWF/bTLMaV0FzRrKUVZZNyX4JqAGoa//xbK2Mj5T0mMGA7rP
	/gxMqJXwTPmXKcwbk2jEj9YLrT9IoQTZG+qimJFemjpL3ZNXdoGHeHfFlNAmM9rvHgwwRUkX9fw3v
	fDwaDhmKhZheLgLhTr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n86IB-0070Y6-Nm; Thu, 13 Jan 2022 20:01:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n86I8-0070W9-Op; Thu, 13 Jan 2022 20:01:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id t24so27141147edi.8;
 Thu, 13 Jan 2022 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CKKBvExIdXR4NmexUNKYFi4XGwRsnmajoIJ3WHiHemw=;
 b=P6MjH8VbEXKaa9Xe+OrKdRO/17t1xnavCQ1iFuARciPT4LOiqcts2TRquGSo5R4hUs
 1HKly7dXYmo1IcgU9eZ4RmPEjLSqFF5kdyQWJnjz5/QihSZl6AGE+jS9VQ77dkxe0Wlq
 0d5L0I0bVSUC+9dy1Z/pSnd9aqqpJeumK3DHxYZz4Bt7jIJWGJuAZdFZ01sJY8HxXVUo
 H6b/dbQhLkC+rjVhwONRlsm3b5c5Qqt0xdGix+lt5LFdDdhVyg85xvsD501bTueWz05l
 Lt99uTyImY/wlqSlKOJswzL3ZLzS0SJI7r6mjE5yB3GbQqi0HzmXON/MMPGHvLZ6JHTa
 WVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKKBvExIdXR4NmexUNKYFi4XGwRsnmajoIJ3WHiHemw=;
 b=evrsuIAsJADPminzr9iHJpVI0QfHCQ9t4BS6+LSp5F7+HB+cjvE3AaiY93hbIabbJI
 b1YWUqaFTl7yVs3WobtDrA9vPaMqjDSNVD7bj6AgJgazFv3kYmkXp+ylLkzsRPGK7HEA
 iMKvF73UTk2z3ttL4BM8SZv8Cslm16YTidsX3a/ZStpt+cyLxqYnf85rIsu4mYIbNiTD
 P9ATvGp9J5QiqAoRYrl7yTBiyC/IqBpzjDHVP6RB4s6WzAFBt3sXztWIdKxOuM4nKthI
 l5RuaxxLy7hFTzPSkdLNkXJ6YHp63JgunAUzjnyTzXNkqeHty0xNZE/qLzaTOLez3bfi
 NzWw==
X-Gm-Message-State: AOAM533+pfHv/gwg48NvIr6j2b8eZGqRd5DVETZLx1v1N9sCdyMDy4pw
 HtuElRng9GS4J0YvUBavtbjLJ7e5VFKQGDjS7UM=
X-Google-Smtp-Source: ABdhPJwslh+6ha9GsyWg4OE9COVsBHcsGl2nt9B4vD1RxEyfjpYwfsR9lnhbTXuKZfXaIgsCtfoSmB0myB659ctydp4=
X-Received: by 2002:a05:6402:350f:: with SMTP id
 b15mr5636003edd.77.1642104106220; 
 Thu, 13 Jan 2022 12:01:46 -0800 (PST)
MIME-Version: 1.0
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Jan 2022 17:01:34 -0300
Message-ID: <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge:
 display-connector: implement bus fmts callbacks")
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, 
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>, 
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_120148_833417_5743B4D4 
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

Hi Biju,

On Thu, Jan 13, 2022 at 2:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi All,
>
> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour) till the commit
> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts callbacks").
>
> After this patch, the screen becomes greenish(may be it is setting it into YUV format??).
>
> By checking the code, previously it used to call get_input_fmt callback and set colour as RGB24.
>
> After this commit, it calls get_output_fmt_callbck and returns 3 outputformats(YUV16, YUV24 and RGB24)
> And get_input_fmt callback, I see the outputformat as YUV16 instead of RGB24.
>
> Not sure, I am the only one seeing this issue with dw_HDMI driver.

I have tested linux-next 20220112 on a imx6q-sabresd board, which shows:

dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
(DWC HDMI 3D TX PHY)

The colors are shown correctly here.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
