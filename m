Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED59CCFA1A
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 21:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFl/QGanj1s5eb1gP0p0HYeLjTQEHYqYoJNkoLf9je0=; b=sEABl48gmOHN3Z
	SaRQvoowtnU2uBP3j5y62BIwNsG97r9oDF+493pbvIYbPQF4OEb1fpqbiXmNuqmdZtHO1GenONtKr
	QmBh3dJnVB1XHJT+kRhBlPHtR4emFT7W4qw/+vKeJqJo/q+tCqG8OFVSllfasbIvpz3MHv5PlHrTN
	lYunH/z1B2hGlnTmgi6yYkQKspMdIJjPJ/7nozNpp61hIxPBfkW8ZCeiNV9YZZCVrPa+eh3VP13LH
	APdLGfshimN9jAyUUOho3RPoPjm1Z/Duv4PvHFd5xgISDPzoWS8aJSfw3QSmBGyJZ//jamlnoGhj4
	31vCcRUJpzJSDAkkTSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6r-00000003Slw-3ala;
	Sat, 08 Nov 2025 21:04:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHq6p-00000003Skt-1D3Y
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 21:04:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so477169b3a.1
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762635871; x=1763240671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=;
        b=RETtWwxx1mMS/E5l7xqeaA2qUYbtSMhf6OvLlhs1uabqs4rdXdsgLEu5iS852sJ9wp
         /ttYlBR4KQclnFYudkLKhhNxuhAMZQ2tpruQoQwODiDCLW1mmEn9pIK3jMSryvng3deF
         8/2zswzH8WsPKufd7583U8u0VASRmZUKuwapa6Z+dx8RmNe/4hOc4VFKgP8nVMxwXiOU
         FAMNBwmblCHaxdtdpmDK5o6GdYlLUVWOOMwP1hCsA21vf4076c9YyaOU00fNaAA3CN0Q
         SJvSoTHWGqKDgfqmFSiOXXuOTjvHzb8CzmS24bPsxmbioCkuQT/qRgvy7Vl6Kekgn2gu
         jhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762635871; x=1763240671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfBxOPKy7fDifZhi6nSzMhp9yBd8dZHhu1E69GOcGH8=;
        b=seRalowG0lsTTnkdbEO4jS51s8R7AJ8fZgLVsOm5XOm0j6ttKTKaC9KoAnyONt0hGO
         qJdZ+o68ZINolyT6XyYhxYZq32BodNHNUYZl7NmR9fz1h6iN0HL3b4ADYlFMnGcBKR43
         BqU1/RoF+vciYymD+ch5Frbc2Y2fsqT4PtGfzRWvDmuhp642Jt+r+eX3EL6CZvgjaTW3
         GtAzndyDoeuGiI3xqEe8teQnjQ6Nrrciqh8hAtzlxta0b/V/fOp9efK6ybOgJk/VGdU6
         VbJrYBmcGzV6AvgXfyIBYrw9Y1Ne0fFSuJlp9MrESirD1aFA10anHM4wIrGkmz6n0KS7
         8J/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnAq6ijzZqYR07TgRzaJbHRPmzzhuTR9KQ2Sjtv5Dh4eqjs8cZR26iB4GAovDAWPnqTJUNL6UeQrpl8uSP@lists.infradead.org
X-Gm-Message-State: AOJu0YxY298hcewkYPBlLIRZIxmHfpXVhSTnNqSXcfeL8kuuZDA0WI89
	93tm2FXD0QhjzzFLxvbKuAU5iJyO3bTZrQnquq+mYbPN356BWBv8csuOAhB4fjFhWRoEFRIwTSm
	whf/qM1EP4ulAx8xp+8aDnZrQY/wxHgs=
X-Gm-Gg: ASbGncuvYTfAJ9VHmjg+A8oejFz6dYisz5LOwu4iRBhVwE/SRMSlg96yjfqK/zemNZK
	tFPI3vfNUP2ZTXYDXKqEEZsSO6j0q23GKHDrYQlha3MsttqweWJ2Juc3dJWFEC1C1xXtyx4jzDL
	utyfmE5Y6ff7CEbzqWpeKO/oAfbnvboqSKNwHS/j3NJ4meVP3Mn83s5qJNvlBW1il4ppKMoU/wr
	88Lfa9Eo3oIwaHtKPBHxGzAhjTvkJvDbPaVUwxhcUIc8sBmh7Q7IKBPA6nOQocm3BDfTHUWrIlz
	ix4rqTKsuauA8YbfAVJUErhBpsty
X-Google-Smtp-Source: AGHT+IH7CCB9+sHT4Gkgb/MZHAPPjHtlGiNAPQ/L76vDJz380AHMHqeGOPDuOGCkaP2NZNwlmUNoZ72lWfi2Lh0v9Ds=
X-Received: by 2002:a17:903:1109:b0:24c:965a:f94d with SMTP id
 d9443c01a7336-297e56df7b3mr51858835ad.46.1762635870574; Sat, 08 Nov 2025
 13:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com> <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 22:04:19 +0100
X-Gm-Features: AWmQ_blQKnrslPLjhIDEU0j0xcOWcQJDgXAAfDygmB-XCYvmXNGV_pkvKxIws4c
Message-ID: <CAFBinCDbx96byeCvLY-Cq2d7r4+RipUVuER57mz1zZ4fgqRd4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock failures
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_130431_338422_ADE57AF7 
X-CRM114-Status: UNSURE (   8.30  )
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

T24gRnJpLCBPY3QgMzEsIDIwMjUgYXQgOToxMOKAr0FNIENodWFuIExpdSB2aWEgQjQgUmVsYXkK
PGRldm51bGwrY2h1YW4ubGl1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJv
bTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4KPiBEdWUgdG8gZmFjdG9ycyBz
dWNoIGFzIHRlbXBlcmF0dXJlIGFuZCBwcm9jZXNzIHZhcmlhdGlvbnMsIHRoZQo+IGludGVybmFs
IGNpcmN1aXRzIG9mIHRoZSBQTEwgbWF5IHJlcXVpcmUgYSBsb25nZXIgdGltZSB0byByZWFjaCBh
Cj4gc3RlYWR5IHN0YXRlLCB3aGljaCBjYW4gcmVzdWx0IGluIG9jY2FzaW9uYWwgbG9jayBmYWls
dXJlcyBvbiBzb21lCj4gU29DcyB1bmRlciBsb3ctdGVtcGVyYXR1cmUgY29uZGl0aW9ucy4KPgo+
IEFmdGVyIGVuYWJsaW5nIHRoZSBQTEwgYW5kIHJlbGVhc2luZyBpdHMgcmVzZXQsIGEgMjAgdXMg
ZGVsYXkgaXMKPiBhZGRlZCBhdCBlYWNoIHN0ZXAgdG8gcHJvdmlkZSBlbm91Z2ggdGltZSBmb3Ig
dGhlIGludGVybmFsIFBMTAo+IGNpcmN1aXQgdG8gc3RhYmlsaXplLCB0aHVzIHJlZHVjaW5nIHRo
ZSBwcm9iYWJpbGl0eSBvZiBQTEwgbG9jawo+IGZhaWx1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBD
aHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KVGVzdGVkLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiAjIE9kcm9pZC1DMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
