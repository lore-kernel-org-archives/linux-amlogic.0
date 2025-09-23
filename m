Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778A5CAC5A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Sep 2025 20:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpEOClp0HGi4o9NQsRdSfnRs1Y29M/VHxkzjQlgsg34=; b=5B22ODX8vgzy/G
	vvo+Ica+Ha0qaOSVWrdc6kQH+lAQ0zI5wo8xT9IwdazPwItZv3sxeWl9TpzqdHszwAU53Ad1sJL00
	mWTv2Xji+18rzpjh4h7o5UMWaCcQb7anFbCgSS/CkJRQGIcf6PG+lJpoXh0vNyzCcBqG8TsIHzg8l
	FUAr3JN3gNB6fsNbTxTotOL9ylkNfRHFc13gkvS5+/L/LKCvRUTV/yetW0NZWBhAtN6bhSZifHY4S
	ukyAHsqrqRb50gfkq1etA6/N0Rb1FmT4LsIDmVjSM3q5CmmV+Z2FjhONeak13RAY9eDfId8n5hoR1
	ULE42Fpleke11bk4rsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19R8-0000000EkpY-11EW;
	Tue, 23 Sep 2025 20:16:30 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19R3-0000000Ekoe-21EU
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Sep 2025 20:16:26 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-73b4e3d0756so50524577b3.3
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Sep 2025 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patriotwinner-com.20230601.gappssmtp.com; s=20230601; t=1758658584; x=1759263384; darn=lists.infradead.org;
        h=list-id:list-unsubscribe-post:list-unsubscribe
         :content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NPEidUGzFtjLd9yCvozmTdMjQVOZTkgK8NCp5IcrWlM=;
        b=TTaTz94fJB74xiNGDmBYfWhqmFfXBIP/M9fdi5LlZ4hI/I0D+YtHPkl7g8Xm4GBAB7
         /nsePgXRuN4kohTpMBVSnYl1xIu4D8VL2Xhikb/z/aluK3ZwpCPiEhuEHZZvqzxHsBUG
         0rzx1fLBgy3rNqeUsU0Y+g6Yz0h6D1VmsQeU5FUtetzHEhT6ShBoqPBccej9AYbSOzpN
         vAycwEWi05uxIovplVuQ65oVlitnPAi40yQg/m1Y+fBBRaBthww72Lpxcg29OkdCBZaU
         OKNaTTxEnpwLvFafm+/Ye7P3GN6g5ST0o+1usJpASZzRhfdT0cy2AUcPB3gCEQoFX2B6
         A3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658584; x=1759263384;
        h=list-id:list-unsubscribe-post:list-unsubscribe
         :content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPEidUGzFtjLd9yCvozmTdMjQVOZTkgK8NCp5IcrWlM=;
        b=DDqJ8R6rizUTgCdZoVsLfyv/kmy5VmQpCYAYM+C/JzLfZZeIitUy/vzWVigrZJPRgJ
         qdQ7yk8Gno+z/9ZJdbR2MooqDRW47alzIniO6Ye65cYa0NNQ39lrB0Po3ouCYuVsjZIn
         Tn3/pF1DYONhRhUhWQaxIfC8T3eTbr/sbnY4eFreI6i6WTEZEvVDUxnSiSMW+b3T2/xy
         uD7PQhR5FWCh5/5rkyu63/kQtEaQf5eBexzYsCTpgoqxNphHxx854QknJ50c5touw/5h
         z/3yQSHsxliZUt83lP7YoId3rqLFY4PPtyV78sV6kxQmByZ33wxUzhv4FvNcRO969oHv
         V40A==
X-Gm-Message-State: AOJu0YxTWTboOra4KTQ2QwuomAMADAeBG53WtLBcKDjBOjl1hvFISlGZ
	uPyVKxnLFKR+J7wnNsYQPegqoEGfFD20JUHKUOMKapQPSGHY7msAFOUkvJYZcKrZAZwZtiiy4e6
	wyq2EdQ==
X-Gm-Gg: ASbGncuZ38Rm/+mUxREVlmhgeTLOGkq9VknXcJ08plsZQdoC0fWFe2RmIg0FWivBwZZ
	k8laMVlz9YNmO/jAvXaUs/K/otu+uweIsAqMp4YA0KrtJHkA1oQ14hfl/jA34kk+0usdvR94VXE
	8zkQursADw5FCEsF1/aSzy4Y4WZ+5vFnwoTh0lS0r9CO4/7Qktv/OIGHxnS/ke9fvw2TxHUA95e
	weDDxq7+/BkGiff55nxYc4imB5vrSGfR7n/sP914n+6HAaSThOX7+iv/2lk5TlliYpDcfoK+cjS
	f8d72cjEL0MIjpw/wSiMQIXipkkO6yThEM3trY/Krx6K3PwhlH2qlzYLQ4lMNjv9bJcOcxW8b0m
	LMQg6L7qKqwYcP0hEu9T0fL0FpquHF0VJvYo/l60cPN/nKKotdVPLc+UgXxx5Nug2hapHBDn3lT
	5hsPMv
X-Google-Smtp-Source: AGHT+IEb6We6ceB8obEhN2Dsv7+l5lE8Mf/9vDzAXXZGORSbXch/2pc+ibtS9PTJxW5IsqkM3DFvQg==
X-Received: by 2002:a05:690c:a4c1:20b0:727:637f:873b with SMTP id 00721157ae682-758a610afc1mr30307227b3.47.1758658583983;
        Tue, 23 Sep 2025 13:16:23 -0700 (PDT)
Received: from etzkeehgor.it (104-12-4-68.lightspeed.sndgca.sbcglobal.net. [104.12.4.68])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7438ac593ebsm30205457b3.55.2025.09.23.13.16.23
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Sep 2025 13:16:23 -0700 (PDT)
Message-ID: <68d30017.0d0a0220.1273cd.a7f9@mx.google.com>
From: =?utf-8?B?44GU6YCa55+l?= <noreply230@patriotwinner.com>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Subject: =?utf-8?B?44CQ44Oe44ON44OD44Kv44K56Ki85Yi444CR6YWN5b2T6YeR?=
	=?utf-8?B?5YWl6YeR44Gu44GU6YCj57Wh77yI44GU56K66KqN44Gu44GK6aGY44GE?=
	=?utf-8?B?77yJ?=
Date: Wed, 24 Sep 2025 04:16:09 +0800
X-Priority: 3
X-Mailer: Coremail Copyright Tebie
MIME-Version: 1.0
X-Yahoo-Newman-Property: optinmailpf
X-Yahoo-Newman-Id: 22d2c0cb-63f4-4463-858a-d3a55acf426d
X-yahoo-newman-expires: 1757516400
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Z-SRV: Company=%E6%A5%BD%E5%A4%A9%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97;surl=https://corp.rakuten.co.jp;comp_siu=https://s.yimg.jp/images/mail/companymark/rakuten/;
Received: from mu-deliverer-felix-release (unknown [100.117.67.182])by mpoppo2107z.prod.jp.local (Rakuten MTA) with ESMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_131625_771933_BF3A4A44 
X-CRM114-Status: UNSURE (   2.33  )
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

5bmz57Sg44KI44KK44Oe44ON44OD44Kv44K56Ki85Yi444KS44GU5Yip55So44GE44Gf44Gg44GN
44CB6Kqg44Gr44GC44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuOBk+OBruOBn+OB
s+OAgeOBiuWuouanmOOBruiovOWIuOWPo+W6p+OBq+mFjeW9k+mHkeOBruWFpemHkeOBjOeiuuiq
jeOBleOCjOOBvuOBl+OBn+OBruOBp+OBlOahiOWGheeUs+OBl+S4iuOBkuOBvuOBmeOAguOBiuaJ
i+aVsOOBp+OBmeOBjOOAgeS4i+iomOOBruaJi+mghuOBq+OBpuODreOCsOOCpOODs+OBhOOBn+OB
oOOBjeOAgeOAjOOBiuWPluW8leWxpeattOOAjeOBq+OBpuips+e0sOOCkuOBlOeiuuiqjeOBj+OB
oOOBleOBhOOAgg0KDQrilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIANCuKWoCDjg63jgrDjgqTjg7PvvIjjg57jg43jg4Pjgq/j
grnlhazlvI/vvIkNCmh0dHBzOi8vbW9lbml4LmNoYXJsb3R1ZWkuY29tL2RpdmlkZW5kcw0KDQri
lqAg44GU5rOo5oSP5LqL6aCFDQrjg7vphY3lvZPph5Hjga7ph5HpoY3jg7vmlK/miZXml6Xjg7vl
r77osaHpipjmn4TnrYnjga/jgIzjgYrlj5blvJXlsaXmrbTjgI3jgavjgabjgZTnorroqo3jgY/j
gaDjgZXjgYTjgIINCuODu+WPjeaYoOOBvuOBp+OBq+OCv+OCpOODoOODqeOCsOOBjOeUn+OBmOOC
i+WgtOWQiOOBjOOBlOOBluOBhOOBvuOBmeOAguOBguOCieOBi+OBmOOCgeOBlOS6huaJv+OBj+OB
oOOBleOBhOOAgg0KDQrilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIANCueZuuihjO+8muODnuODjeODg+OCr+OCueiovOWIuOag
quW8j+S8muekvg0K6YeR6J6N5ZWG5ZOB5Y+W5byV5qWt6ICF44CA6Zai5p2x6LKh5YuZ5bGA6ZW3
77yI6YeR5ZWG77yJ56ysMTY15Y+3DQrliqDlhaXljZTkvJrvvJrml6XmnKzoqLzliLjmpa3ljZTk
vJrjgIHph5Hono3lhYjnianlj5blvJXmpa3ljZTkvJog562JDQrilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCg0K4oC75pys
44Oh44O844Or44Gv6YWN5L+h5bCC55So44Gn44GZ44CC44GU6L+U5L+h44GE44Gf44Gg44GE44Gm
44KC5a++5b+c44GE44Gf44GX44GL44Gt44G+44GZ44Gu44Gn44CB44GU5LqG5om/44GP44Gg44GV
44GE44CCDQoNCuS7iuW+jOOBqOOCguOAgeODnuODjeODg+OCr+OCueiovOWIuOOCkuOBlOWIqeeU
qOiznOOCiuOBvuOBmeOCiOOBhuOAgeOCiOOCjeOBl+OBj+OBiumhmOOBhOeUs+OBl+S4iuOBkuOB
vuOBmeOAggoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
