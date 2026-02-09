Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EB6E94614
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qM0xmS/YsB/xdzfVGq9Vj89PINjo4vXf2I48gW4Qx4=; b=37ohJti/UA5U1x
	u9sD8Fcp70225++hiIcMBVTg8LVeJIBi60GmNgUwdsQQ+cfwBLL3x2+iaFTYaf1lPf1jf/wbjvDSp
	O/kwl/oYfL5VA8IaGG7PYMcMak+IefBS6RI6GeVVC0N1WwOdOpRP2C0tOZKn9WC0huG7yWxz7IPL9
	txs42sZWDys6TlYjduxkx8r5k4qPYoSb18qElp/j6sqdHwp3yTEwdEi2EQTrDBpHE5BcJYXya9xG2
	Df2y1KG7z+6Ig1a6qKiw3jiv9xxKqsFe9OkUBRmxd/daq1e3Glr527U2xv7joj/P9Ydr8O9tNeuYQ
	0kehDVoGyeYwc0qgBnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYs-0000000G5jH-4AmD;
	Mon, 09 Feb 2026 22:16:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZYq-0000000G5iK-18Ck
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 22:16:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a871daa98fso24309245ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Feb 2026 14:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770675411; cv=none;
        d=google.com; s=arc-20240605;
        b=fPWcFaYSxIcEA1EOYwgTsPqCl9UinArdrF+bK9NynUW5DpLx3Slxa7KFzqZp5gCrPZ
         Y05EfWzvozlbLzQybIcrzpD+maNlShyLvUcrfWVstwVH4oCsbl6N9Pv3RF6usGVVo/YA
         WYXv0cnA4gpEmAHbqXmcC+C3ALe880SRZsOrQaMiCnGJ7xQlNmfOIOxdxzeinKS8vnWP
         rubOf8l/PTE9nVTCB1CqZxAnnQRkKFt+d5fq3StRcteSGOsPQ+xKwYWlx3Sh673qVLyN
         VLsjrXPOgokiO+jdLbsFi4PDJhZmUZzs/78UvWDnwIo9STzNIGK914yUsyFlcpKWz3J3
         ZuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZNWuHTz1b4dbqUo0JhBGtJ3efYqVaRB651Yqhx+M9I=;
        fh=q/DP0MoolG2m4X6WTMKUgTDYfQUjS93txDinOfbzIwA=;
        b=QSI/BA54jrw8PlDhFyrb/JN1FVw6zE0+sgjBREUj2SjYEL7ePq5BKaouIj0qj+EB4s
         ls2s1k9qrIYoikQFhOn8UNGUCGr6nkuCS7OE1aC5QwAyxa/tk2+WfXTOcufF+q/tuCv/
         B0xEg9HmVwGijZgAfgEL4beLNmsFhLi6smN+HXyy7C6awqb5PA/egL5pYyJmxs9hN23k
         WWWYtWKVNGUo1LR9dpNTuYoZ/dMEJ0XQu9f5gQArB0xWRAHJYeeqbyjkXRvygheEILfL
         e9aKOtC+qvUgo3jTVwTtwJxgOMQhrJXlvbSTCXCa6Uf9y8vFAytxsJziueFzFAO8byCD
         Hg8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1770675411; x=1771280211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZNWuHTz1b4dbqUo0JhBGtJ3efYqVaRB651Yqhx+M9I=;
        b=iyGs+r5YPOekIxsg/MXop8B+RDgHpcJ4gaA9rHwR9+YMdU2AcsKea9QyyqdV8YhHxN
         FIdXF/wgLst3uWfasgCASrC4EdIVF+ZDh6E/SknuuPprYJxUJhdJtv+uLioo45DVrd8W
         FwzO5JTgVbAb33I/5ico2hPYi/L+Ld8vgLCERMQkHfdo7XC1dm5kdMcyLq2AFlTNrBtj
         ce52Ey1Nn2Uz4YGobJWwdQFfNmgJZLUxMTJlQtAB/60Gy6k1sF+vXlxh460NDzLiEhEX
         NtgGkgtaITpwn86xeW8XFX5z17SnzUkKHAYqCAx02FmqvlzdbkGmHaKHoN2tEOUdvuW2
         8AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770675411; x=1771280211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZNWuHTz1b4dbqUo0JhBGtJ3efYqVaRB651Yqhx+M9I=;
        b=JQcNc2FZDsFxcXJ2XTnqd3iGRY3OpxhPr/QR55DyN2Ll6vlSJVSzuktkfJ1rD9OcWw
         IPbTqXlRN9E/SAGZ+DBWyXp1SeCmx+x1zyMUtLjJNKRLqFVZc26a57Du79t4zoar730m
         HPheZq0srrvRRS2ztdFg8r0i2Cb4t+0ouWo+fo1gEWvX0beg6LYzjwqHRjOUDFuq68hR
         SxBEgL0GyQ71l6tjAELdo+FTJgf0iZ+PWQFUdTDRZDCyp9aSfmUpJ9dAn62Ty6b6irho
         nKEUGwMP8i7Z11WIGEHGEKc1ms8aAplYhIvCtw93peh0DECZPm/LmoxutoISj5puEQTO
         rlTw==
X-Forwarded-Encrypted: i=1; AJvYcCUqirIq1qTaVSY72L9gAcGxSHS05DB/w33laNv0YveqZXoLLWAbRkjtR7xVt5jmhsLvV15ar6qn3VKCopAW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7uG0AIO8cZYo5IrXLnH7e26aWSmx2ssJXqG1Q761miMfS3Hvo
	AlRwBOBlK/fdS1HEUusShG5tZF7fV45Ni8mUWElSGG73oCeVcq1gTtkKDBVNipn4kHxnlRZpOo9
	s6mHoUf88Ay3RiWwoio7L2MqgzOZMgj4=
X-Gm-Gg: AZuq6aINzxcNNneylcf/w+QIuYkXYoDAeG+DCBnBNKD3eYkDW/U3JBFovEh16GWZFSX
	mIDPngJIr2kwoX1bec5cMGQfQ5YKGsFJb4R6IFUOhKVr6W4YnYVZMzQ6T8+zTIdGGyU+h0Ld50b
	16ujT885+QVY3XnA57JwVA+2/NlSWuTqq2tPQ3ROJsmoY0ILzXc/2GmD+K2HFj/crsGsvQYsrHF
	XKRtgwv9cC3SFJCfSbyrWn+DfIdOfBAt3RobIHNUgshrT3P7WsyJH6EMQcUeVii2VnKyrx7W+ve
	iyJ7rbRAR/b+IBipJIRsNo2ygFT6
X-Received: by 2002:a17:903:1b24:b0:2a9:62ce:1c12 with SMTP id
 d9443c01a7336-2a962ce2047mr97146675ad.53.1770675411337; Mon, 09 Feb 2026
 14:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com> <20260205-a9-baisc-dts-v1-1-1212b46f95a7@amlogic.com>
In-Reply-To: <20260205-a9-baisc-dts-v1-1-1212b46f95a7@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Feb 2026 23:16:40 +0100
X-Gm-Features: AZwV_QhquR0hlfJ-1NnFo_9al9F-KxCRrVsi-UMsb1efCpkm7v4Q1O8T8O58qzI
Message-ID: <CAFBinCBMQNrFdAdhoxPCfJi-SU1kdhovmaJ6K9WwEQuiMfhQ-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: amlogic: add A311Y3 support
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_141652_316307_C6D36F03 
X-CRM114-Status: UNSURE (   7.18  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCA3OjA04oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxh
eQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4K
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPgo+IEFkZCBi
aW5kaW5ncyBmb3IgdGhlIEFtbG9naWMgQlk0MDEgYm9hcmQsIHVzaW5nIEEzMTFZMyBTb2MgZnJv
bQo+IEFtbG9naWMgQTkgZmFtaWx5IGNoaXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpo
YW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5z
dGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
