Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950B2EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Aug 2023 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMCedbxTi8uXnTJhjNdb0FRtOWoYQt3kfpGYI/C7sIo=; b=Ubsl7hDugj4pcb
	UyERaC1lCYAScoHqiMJlgIi6LH+7Gbd8/X1HupNiNuW6lEtGwxNAarhjwTZlIHrJQE8n+UE1D6PUb
	9siZXAUxQetuL5CZacEoEaQqq5VcRxci4IRU/M+Tm81huLJEaCKfL/c047aUJVU78RLcSWNOmMvQI
	xA1x6JVC9vyQExlAP7sL5cDpbe8CZauXnuav9fQDMoMWNGLvp/MBmLL3SZ1HD0ZwosJRdwdGMbFyJ
	3zLLA8cxW0914Kk0BObMrl+egY4Le7i56NyyyaeSGUZFxWDaiibtRs8YAniOqrNkfd63HU3mNgyD5
	cgbWxn7HxBl/fnEJ8JeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUU9R-00AyJY-21;
	Fri, 11 Aug 2023 15:34:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUU9P-00AyIS-0s;
	Fri, 11 Aug 2023 15:34:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D64C16757F;
	Fri, 11 Aug 2023 15:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A92C43142;
	Fri, 11 Aug 2023 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691768045;
	bh=4MzACdlIZlT4kiPh32h+2tEBbj8sHiOYBV0xuY5gCnA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mpfa5cR3b+qbCipAmz4ccGTs8IP5FeChN+a1Nj4juIiWEW/BPKTTOuBtoTxSBQCoq
	 3MM3tUqdZOHesQXsmFxnepxoEBL/joOxTkJI/+nSu9vXMfAL9X0ixhuh8ZBkddf3Xh
	 gxJx9SflcBDNAMZtz8EYMHmK3/IXLs2KOAnFn9L7bCxv0LI9cqEDbf95C4OdZr+rd+
	 lOc0/GnBug1uMVskR5UOKKDgshRzCJosGoLlw4/nfQmGs04rnrYkPTlcKtvwy0+X8i
	 GPcIEXttLhFGrRHgplcoulyInwRbSUtZ7MtJq5H6pXgfGTyJtkftnKTY7sQIn01HGi
	 HKe8T9+vWm/gA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ba0f27a4c2so32303741fa.2;
        Fri, 11 Aug 2023 08:34:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YzpFehvjCYwkAyvFzqbqdZBIUaRixM1OpC3yX5RDRLtPLxBwXJ0
	I2dBxp026I7OUY1tVTBNjulnCXdw+rBnr289QA==
X-Google-Smtp-Source: AGHT+IFZ3aVB1SpfouKUheoAhPAD7BYG9/XysJRzy/GBST8Zv2ieS8bxN0limvWccpCh2IOb7uIAdnGlwJrc/UBdW1Q=
X-Received: by 2002:a2e:7809:0:b0:2b6:e625:ba55 with SMTP id
 t9-20020a2e7809000000b002b6e625ba55mr2028099ljc.41.1691768043319; Fri, 11 Aug
 2023 08:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230629073419.207886-1-tanure@linux.com> <20230629073419.207886-4-tanure@linux.com>
In-Reply-To: <20230629073419.207886-4-tanure@linux.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Aug 2023 09:33:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKd_XYB682eHoW+omjGWLpuz0QL6zc0VB7u-Lm+X=PmOw@mail.gmail.com>
Message-ID: <CAL_JsqKd_XYB682eHoW+omjGWLpuz0QL6zc0VB7u-Lm+X=PmOw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
To: Lucas Tanure <tanure@linux.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick <nick@khadas.com>, 
	Artem <art@khadas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_083407_363574_8A7D1E6A 
X-CRM114-Status: GOOD (  12.35  )
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

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTozNOKAr0FNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBUaGUgbmV3IEFtbG9naWMgVDcgU29DIGRvZXMgbm90IGhhdmUg
YSBhbHdheXMtb24gdWFydCwKPiBzbyBhZGQgT0ZfRUFSTFlDT05fREVDTEFSRSBmb3IgaXQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gQWNrZWQt
Ynk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBk
cml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpUaGVzZSAyIHNlcmlhbCBwYXRjaGVzIHdpbGwgcHJvYmFibHkgbmV2
ZXIgYmUgYXBwbGllZCBpZiB5b3UgZG9uJ3QKc2VuZCB0aGlzIHRvIEdyZWcgYW5kIGxpbnV4LXNl
cmlhbC4gSU9XLCB1c2UgZ2V0X21haW50YWluZXJzLnBsIGZvcgp5b3VyIHBhdGNoZXMuCgpSb2IK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
