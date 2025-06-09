Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA307C61CE8
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jun 2025 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICLh2lZBfC2CVrPPRvc6Oai1zfNuZAmgx/Eeyy/q2mY=; b=mYrY0b1pzKi7RG
	EuxAfg2K2TNt25JLgvR1yVIBSX2g3DQgGEhwIie6BLtxjetBICvfEa9wS8YOKWhqKXSdfdjAOhQ0D
	ahA74YNyeRioyZiWp8932SY/JorCahNoTOD1vbLLUKthIht/XPVIn3bbWjK2IALyXpLOC/8M/Sbww
	lBhU1dr0+biz2ZQ5T88gOXRerx88gY5TeJtnpYNiHXVwCOAtBFEK1o+ZGUlrimIgN0GXxmw0DPAwR
	wW7za43CTW8K3WbwqjrsqMtuJhikJqxmgLTE/Pn3ZN6D3DfUN2LES3H9U1u6hJd2a9fmogV+mUW4y
	xODZ7+JXil4k2RA7mX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc94-00000004CEF-0qhc;
	Mon, 09 Jun 2025 13:02:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOc8z-00000004CCL-2kxV
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Jun 2025 13:02:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-452f9735424so8971845e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Jun 2025 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749474147; x=1750078947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=mCaDYx92QwWyTBZqf/BfYcyFfTfBHcwEE/6ToRDzS96uvulVXhHdIbAIqenH00vyqU
         3CWg3mY8XExX8Uts5au+quasXEjgKzdVfmn0rtE0Pcd8rEwubuTiNe3kV//vMTD8K3EN
         gILuPEAuBE4YtypOdp25ULxMZ4Zbs2AanPpWRZLb2ygIQv7qCSc5VdZbGUaBPH81nMJa
         gqyMR3tjzICcGQYFQHLg9i+KbX2Op0YILP5bwU2WTYU6WxuFT8dUYm6zEXpdoXppBqiy
         KPsBDqm8vmzptY6rAPK9b1kQzsqISclnfC1ZwtIex8M+XecL29wZJOYdb1QtDiUR3mMI
         ++LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474147; x=1750078947;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=AEl3WYszw7DVQ4DTH508asU/EnNrsxlbNv297LAzS4ogoSWKM2CREsRn3PIl0LgCeG
         CniUXC/40az6dyUbJIf1QGbWvb99fWI/6Opqt0guKni9kVq5DYXcFnHBx+xICLqlGvZ+
         4fM+eEwWNFSiwnEgWSfDT73zXEzDFjf4FvxgKGEqqUQ4HBQx73aNK08P/SgMDKsWETcX
         zBUqLzkrqlIMMdNVHUsmCktL3iGO0HLiNKxU3uj44bTUo9LkX2zbUz1ba4E3TQrPhTES
         sQzbZR0c3fSWc665y/EnGei1WUWXUrkOomis8Eh3QKwp4KNNCOgGVf7SP3Ck1NLNfzdQ
         r7Og==
X-Forwarded-Encrypted: i=1; AJvYcCXYUzyZoSY8c6+zw++yD4j1D5ydaR3gnSBOhqzD1MbOx8XpE9oe2TfE1rvGitKrwQM9OKFQVPS7KLeFK7PN@lists.infradead.org
X-Gm-Message-State: AOJu0YxOv7E4Un+eESi0vJLpW7f4NgnHoelCAHZjjacOo0Cf7NnNbfQn
	CUhJGOM11y5BH3itHs36hiZL8vdBkQb+QZuPsZ4ZEOOio/k35Ig7hEJ2TYo5T6hwsfw=
X-Gm-Gg: ASbGnctoCL96CF+UwmmZ1n1b8Mb5LEQkGD1sFDAXFcZo0UfNhXsNZbJftwHjfQc5dmt
	+HotkITsRcFVr7x6NNUhGo1unHgxlybng80UOPbzfc5LSObHLiaCOkBOKtnSbParjMXnZqAMR8y
	GXeDNKk0CNzmEdIFs0hQ1WFIvNxXXr7gU87UKlcKTuJtVjU6niBftt3t5LT1320vixrZgkcaTSf
	JygJOgxb/5uAIHhxTK6D1s7hrnEjsVzT5RgS7Qmf/io/+G4U3lJkKJO5KPB7wVUUsG4BBnUr46e
	7Zs9zbFOtFiz1b3lScmmSAyOLZPqxIqO5/HZ/ncE1G39zTSZaGU=
X-Google-Smtp-Source: AGHT+IEC224y8+mr5qcnD9k9Q2VLvv7fn9ojcXNf/BK82QyxQgrEFMVWAZeFnV10+zDndt5WfXGhRg==
X-Received: by 2002:a05:600c:34ca:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-4531058ffa6mr39477275e9.3.1749474147101;
        Mon, 09 Jun 2025 06:02:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1008:ff30:c454:e59e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452137290b9sm110888675e9.34.2025.06.09.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
In-Reply-To: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
	(Doug Anderson's message of "Tue, 25 Feb 2025 08:04:57 -0800")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
	<CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 09 Jun 2025 15:02:24 +0200
Message-ID: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_060229_813012_34BFCDBA 
X-CRM114-Status: GOOD (  15.17  )
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

T24gVHVlIDI1IEZlYiAyMDI1IGF0IDA4OjA0LCBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJv
bWl1bS5vcmc+IHdyb3RlOgoKPiBIaSwKPgo+IE9uIFR1ZSwgRmViIDE4LCAyMDI1IGF0IDExOjMw
4oCvQU0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Pgo+PiBU
aGUgYXV4aWxpYXJ5IGRldmljZSBjcmVhdGlvbiBvZiB0aGlzIGRyaXZlciBpcyBzaW1wbGUgZW5v
dWdoIHRvCj4+IHVzZSB0aGUgYXZhaWxhYmxlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVs
cGVyLgo+Pgo+PiBVc2UgaXQgYW5kIHJlbW92ZSBzb21lIGJvaWxlcnBsYXRlIGNvZGUuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+PiAt
LS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0OSArKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCj4KPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+Cj4gSSdsbCBzbm9vemUgdGhpcyBmb3IgYSBidW5j
aCBvZiB3ZWVrcyBhbmQgY2hlY2sgYmFjayB0byBzZWUgaWYgdGhpcwo+IGNhbiBiZSBsYW5kZWQg
aW4gZHJtLW1pc2MtbmV4dCBldmVyeSBvbmNlIGluIGEgd2hpbGUuIElmIHlvdSBub3RpY2UKPiB0
aGF0IGRybS1taXNjLW5leHQgaGFzIHRoZSBuZWNlc3NhcnkgcGF0Y2hlcyBiZWZvcmUgSSBkbyB0
aGVuIGZlZWwKPiBmcmVlIHRvIHBva2UgbWUgYW5kIEknbGwgY29tbWl0IGl0LgoKSGkgRG91ZywK
CkZZSSwgdGhpcyBpcyBzYWZlIHRvIHRha2Ugd2l0aCB2Ni4xNi1yYzEuClBsZWFzZSBsZXQga25v
dyBpbiBjYXNlIHlvdSBwcmVmZXIgYSByZXNlbmQuCgo+Cj4gLURvdWcKCi0tIApKZXJvbWUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
