Return-Path: <SRS0=mB3M=XC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1CCC43331
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 15:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3A621835
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 15:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bp3Z6XKd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TtZYR2EF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E3A621835
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKlABoGlOYFX+eXreyQUi0DANVEpdS6AVWORWpQ3cLQ=; b=Bp3Z6XKd4FF2EQ
	OgxU7SAk4PlPe0h8t8xG5wp0H2DfJTWUcHUOMfoyJfC0PDcCwmA0zn2e/ssb29JFJKd+tIsevp/ch
	+WL31Dii04D0SnvnpYhSqEz0ZPuA3diQ3H+VSBO3Bf+njK8Hp6nYqp5RvwdtmIOvxga2dz7Rw/1Fs
	gmG9fN86fWUq9+soRmhIO/k6IWPlRvD2uAv1PYYgFV+K3PQxlCNRAtHP9GxPWZg54cDQtrFwMNwF7
	LDb9ukrJWHu5pDJTk2i25m5WHAVH04C3rY1Wz2iGf3rugf/Lb36fVZTlZs8MpX17K/26F1QDD0cCm
	Akdd7Nc4ILwzfsj12m/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6cEG-0003Jv-7i; Sat, 07 Sep 2019 15:02:20 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6cEE-0003JU-6k; Sat, 07 Sep 2019 15:02:19 +0000
Received: by mail-ot1-x343.google.com with SMTP id g19so8485407otg.13;
 Sat, 07 Sep 2019 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQuUa7SD4x8TPRd4rEMdVFipQdAElSjSwWznDJwYZRs=;
 b=TtZYR2EFApgjge1T6n3joQtpMqyYmTxuLma+kCVNN7wn/Td2sozX4uMMJyJOBh7cW4
 kuejU+OweVVkrAGmTKoS9jy8O7VSEzhwrKsu/XQYz4JGiLlb4/v9Oj2K61iItcV03uxD
 XGbdCpzAYDZDHIfItszdiml7ALRrPBQy7oYrMe1M0q9v5OmefhcPQP6bdBjS2OFHuIHp
 s2aIyVQhQV7q5e5QDOqkOc5hFXeTww48b2ucrRtyI2y5k+8+dElAjTG39dpzMzVHV+ZF
 8mGjwrC0tO9qU5v86blecaWHXjKJC2KfzoeW8mWAmuyr6tKzygm8r2rBxPtqpw1GAF8z
 ByfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQuUa7SD4x8TPRd4rEMdVFipQdAElSjSwWznDJwYZRs=;
 b=Ynq96QsQD82Vczd0pybUOzJuyUuOn6kxiaXvewQ7LWfDxABl61gjwkxeqJ/+SEsS0M
 aRg8Hw703dj9FSA7ZY0l1F5gCJdUlEiMClQ5G9iPrPzcsRTMujKdvi7w2S4E4/lucPby
 YNUFj2ERZ0qY3yq1+v+hhvL70mLf2c4fNGRxrh5HkcVKowxK/jNuSXkHzMJ18KNMw6eD
 ql5Wu3voQ42Ss9oV0NgWLEaosbzBgfm75zmy/cIZCSN8W7TV2kxZcb8QpasU12mJkPul
 WN9/HyuYevSRIvxMtVn+Zqb6eLbKeXmoX2bg3KOaXWtqjVoANtygH9YCFNGqZo75Cpgo
 GWoQ==
X-Gm-Message-State: APjAAAX12RBblrOxec+qelpe80JFk9dxoEpovnrWsUYFWHK7kbIirqb9
 wxdewpKmrZMl3X+f2UWdztM3ZWk+CK4eLKdeETw=
X-Google-Smtp-Source: APXvYqzw933n7nrVPDE4QwDETJQm86n4LQrpvyL7WcPRzCKuuvqnDMkVghSGxwDP0EhrM2T8GOZ8diF0Pz2476G3pcE=
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr12429347otk.81.1567868537282; 
 Sat, 07 Sep 2019 08:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
 <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com>
In-Reply-To: <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 7 Sep 2019 17:02:06 +0200
Message-ID: <CAFBinCD7gFzOsmZCB8T1KJKVsgL7WMhoEkj3dRzyqwAnjC0CNA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190907_080218_251978_E87EC31F 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Tao Zeng <tao.zeng@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

On Fri, Sep 6, 2019 at 7:58 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
[...]
> > also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
> > aren't there any busses defined in the A1 SoC implementation or are
> > were you planning to add them later?
> Unlike previous series,there is no Cortex-M3 AO CPU in A1, and there is no AO/EE power domain.
> Most of the registers are on the apb_32b bus.  aobus, cbus and periphs are not used in A1.
OK, thank you for the explanation
since you're going to re-send the patch anyways: can you please
include the apb_32b bus?
all other upstream Amlogic .dts are using the bus definitions, so that
will make A1 consistent with the other SoCs


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
