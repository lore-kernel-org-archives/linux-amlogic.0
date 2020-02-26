Return-Path: <SRS0=KJO1=4O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5987DC4BA0E
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 12:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3772467B
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2020 12:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIp1K3w4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKlN8HgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3772467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABKlqWbzMhDh14csZKAeYGYEVQL0i2TycMD3PI5kMTU=; b=uIp1K3w42Magee
	FkYRHHLWu1jsZlgE3ad89u6q6HMUfQ3DY94drCwIqiDXhwxQ5NbVelMphHAv/OVvdB1kjMBa5Cq4y
	pXNWInZvF/5jlB4aIH+pIpeZeWMdrTxMgqE5G7glIkWIc74t2ePSwLiPTPt7VQZPfQnlU5MxyM/8Z
	ABJf3j1YjX1xDgdcOgOoMyHZemfV18dYqO4nlgJ9lzYHNEgGNm5ANm5D5GVg/5LsOlnROaRgg1OXv
	S8b8Wp1ZzQAYFMR7bjDp8KEILD3zPVchK0ysHt4eSsZpK/o/9ByC8hBhhp6eEJyUsiLYFLOstO7N2
	wDfWe7TgmiIjA6rfqMjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6vUH-0006Yi-0I; Wed, 26 Feb 2020 12:08:25 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6vUB-0006YC-Uk
 for linux-amlogic@lists.infradead.org; Wed, 26 Feb 2020 12:08:23 +0000
Received: by mail-lf1-x143.google.com with SMTP id f24so1800216lfh.3
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Feb 2020 04:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S9JJYIkNlP5nnK3wfZZu/X+SbI6aTTWOA87BK2SDDno=;
 b=fKlN8HgXtxN2pScLUyXqaU2uMf2lHDdWgGN0YorCQqJiyRnrHxxv++xhjpyp4nJ0n6
 MGjQACQUjmwX22flv3nS8PHVJYGT4oOArcrtzYKk4o3gwoemxxv5UCct/9Yp8q2hyM5t
 VlPGg1SYuNex0ZU5SRkMFrChNs7KMC931tZgSegsc9Q0wrS3huNnj5eunAPfXIZOpSQ+
 3HWc0aOpexHwRciEWsAX2yQYGC/FRJ4nituPrcObbFHn97RtclII9L4fKRfrkVneveuz
 nxoO0+0kCdR+q40YKfIbLSM5KyZLJW+voidkAsXwCyiv0betswmHnBsK5rBnK0JkzybZ
 lsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S9JJYIkNlP5nnK3wfZZu/X+SbI6aTTWOA87BK2SDDno=;
 b=LlB/b3gQUkR3cU4bjEux6id1d+IJEcVbz1Xeb5dFkvH3XX5Ylxw85Qkh8jFWxodxWS
 0HIiIrdKQJPM9UZj5dDG/iZIF5lHOuacQV9Sbz0wXjFUWNnDeb/JMqEuMfd8+TlgJuIP
 CVUyT6pFR5xNjQqJENC87L5Lqmy8lSfqsTBbRpSVLmdXPxzOzGJojdQJLt2ekYszIlAY
 iRpa3F+s7v7zKo5KbWEzHknvjqEMQK/IKUV8XfjB6Cm/Jy4zMBhkOwFyuLTj+b849ykq
 GrM7p81KPf9g+fwDkkjArisOy2NVTcEjG8W4vYRQDlVCVSBekCj0XUFH/f65R+DHZR31
 qKcA==
X-Gm-Message-State: APjAAAW7PlWWSjDR5db2dnO/ZOnro5o0zP8WjLtMtxcGPYPegxCFsLbJ
 euq26p0wisZCeLQG1Y2ZFrQlZEmvfG5/d9k0UAZCJw==
X-Google-Smtp-Source: APXvYqw8gFoORTwT9oT2KeMHn3WNzmj9I20a9wQ+SMdkIuI3epVQlzv+ANEqiMJJC4viusDiSZCX4jG7GU6F5yyPgus=
X-Received: by 2002:a19:ed0b:: with SMTP id y11mr2359667lfy.77.1582718897894; 
 Wed, 26 Feb 2020 04:08:17 -0800 (PST)
MIME-Version: 1.0
References: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
In-Reply-To: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2020 13:08:06 +0100
Message-ID: <CACRpkdZ4H5fdWsxsXnsbyxb6fwKbgm0h5a6CdqEjU9w5+z0a7Q@mail.gmail.com>
Subject: Re:
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_040820_021139_1A63C7D7 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: Josh Wu <josh.wu@atmel.com>,
 Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Eric Anholt <eric@anholt.net>,
 nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Paul Kocialkowski <contact@paulk.fr>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Gustaf_Lindstr=C3=B6m?= <gl@axentia.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Robert Chiras <robert.chiras@nxp.com>, Heiko Schocher <hs@denx.de>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Vincent Abriou <vincent.abriou@st.com>, Andreas Pretzsch <apr@cn-eng.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Purism Kernel Team <kernel@puri.sm>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTI6NTcgUE0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBGZWIgMjUsIDIwMjAgYXQg
MTA6NTI6MjVQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gPiBJIGhhdmUgbG9uZyBz
dXNwZWN0ZWQgdGhhdCBhIHdob2xlIGJ1bmNoIG9mIHRoZSAic2ltcGxlIiBkaXNwbGF5cwo+ID4g
YXJlIG5vdCBzaW1wbGUgYnV0IGNvbnRhaW5zIGEgZGlzcGxheSBjb250cm9sbGVyIGFuZCBtZW1v
cnkuCj4gPiBUaGF0IG1lYW5zIHRoYXQgdGhlIHNwZWVkIG92ZXIgdGhlIGxpbmsgdG8gdGhlIGRp
c3BsYXkgYW5kCj4gPiBhY3R1YWwgcmVmcmVzaCByYXRlIG9uIHRoZSBhY3R1YWwgZGlzcGxheSBp
cyBhc3ltbWV0cmljIGJlY2F1c2UKPiA+IHdlbGwgd2UgYXJlIGp1c3QgdXBkYXRpbmcgYSBSQU0s
IHRoZSByZXNvbHV0aW9uIGp1c3QgbGltaXRzIGhvdwo+ID4gbXVjaCBkYXRhIHdlIGFyZSBzZW5k
aW5nLCB0aGUgY2xvY2sgbGltaXRzIHRoZSBzcGVlZCBvbiB0aGUKPiA+IGJ1cyBvdmVyIHRvIHRo
ZSBSQU0gb24gdGhlIG90aGVyIHNpZGUuCj4KPiBJTU8gZXZlbiBpbiBjb21tYW5kIG1vZGUgbW9k
ZS0+Y2xvY2sgc2hvdWxkIHByb2JhYmx5IGJlIHRoZSBhY3R1YWwKPiBkb3RjbG9jayB1c2VkIGJ5
IHRoZSBkaXNwbGF5LiBJZiB0aGVyZSdzIGFub3RoZXIgY2xvY2sgZm9yIHRoZSBidXMKPiBzcGVl
ZC9ldGMuIGl0IHNob3VsZCBiZSBzdG9yZWQgc29tZXdoZXJlIGVsc2UuCgpHb29kIHBvaW50LiBG
b3IgdGhlIERTSSBwYW5lbHMgd2UgaGF2ZSB0aGUgZmllbGQgaHNfcmF0ZQpmb3IgdGhlIEhTIGNs
b2NrIGluIHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugd2hpY2ggaXMgYmFzZWQKb24gZXhhY3RseSB0
aGlzIHJlYXNvbmluZy4gQW5kIHRoYXQgaXMgd2hhdCBJIGFjdHVhbGx5IHVzZSBmb3IKc2V0dGlu
ZyB0aGUgSFMgY2xvY2suCgpUaGUgcHJvYmxlbSBpcyBob3dldmVyIHRoYXQgd2UgaW4gbWFueSBj
YXNlcyBoYXZlIHNvCnN1YnN0YW5kYXJkIGRvY3VtZW50YXRpb24gb2YgdGhlc2UgcGFuZWxzIHRo
YXQgd2UgaGF2ZQphYnNvbHV0ZWx5IG5vIGlkZWEgYWJvdXQgdGhlIGRvdGNsb2NrLiBNYXliZSB3
ZSBzaG91bGQKanVzdCBzZXQgaXQgdG8gMCBpbiB0aGVzZSBjYXNlcz8KCllvdXJzLApMaW51cyBX
YWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
