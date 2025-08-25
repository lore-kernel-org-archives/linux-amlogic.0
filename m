Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2516CA0FE9
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n7zlpQtyyFRNIVwE8EhG2Cn0RgJzvEIGnpstbhEg8T4=; b=TY5p1XxbQRuHLO
	TvtbQqUm1asw8U2oWrvA2aFmhX2/eeUTBStlj/kJTHffkiO9ObM5OWeQrgAscpHGmrCeVx+OcLeqq
	ACyqrWap+fsLpkWXAH1GfAowcBdEKEFffFwlsHof78zf2gb6w70T/lnfP9GtYTYvB47aWMPiAA+C9
	zZ1kNEAGmYJC358ZESYnSzFeEUSgR7k06nvkMH/0cWk69oCOxGpiQfifqJkakUgIkHIy8fQJphaU5
	4MWHBBiwvqQbCfDrSBTKvCSl4u5HSAQE1btgrvxfW2eDVtU4DqW4nOHowA3hXkV+L+j+6Ss46fsPB
	BoKY5WqdzRLFLx4QbJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRGj-000000077Lc-27V5;
	Mon, 25 Aug 2025 07:05:29 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR4T-000000074gZ-1atj;
	Mon, 25 Aug 2025 06:52:50 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso3436802b3a.1;
        Sun, 24 Aug 2025 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104768; x=1756709568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nPSWsDoAmy8PQ775XW5/42G5LT1wuElB0TP9BhSo2b4=;
        b=djpGPOrf1lZuUoUzVrtKMx8+Tjm3ASMKdmUrx7nRRTTf6xrP18PlfMInbtoi998Gl3
         gFqcRUxHT9EBq7j/XIu1N9vPeWbfk07oPUq03xtD6XVoS4ta1bX1VL6nStEb3ar2K0Zi
         KF03gpsp4TSMpw614cLtK610mth+w/GgFbKSzRxWeI1L0KJmsrn9ci/pYZQ1YcmVy5tM
         v6Vpe9nrWNL+4xJ43ghpRMLBEo7s9rtDmn9tQ5DYkfrFD4qDBqlhfBPTYwOiH4j4IBqY
         8gYf3KCz65a528qpPb1dTFqc+iUsgF5t0G4H0O2A67X8iT0yVVtScxLhJVRmIXf0xeVq
         lQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104768; x=1756709568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPSWsDoAmy8PQ775XW5/42G5LT1wuElB0TP9BhSo2b4=;
        b=NaoMFT/VbEaPH/7CqJj8ME1rHol5fK6UdStcQKBaNWEfu23FeM81oeoN0vTSlGNZ9b
         jEHFLuYFKW666Latg0drMT03GcYn6iT5z4JKXko+YQrus8Ve8jflk1zaUBtlXRoHKRDP
         YUrBbzWw/ymcsxRiyQ8VrQzEDR7iiZe3yXM5kvmzVvyTgyvfiTOaKnbDKDPWZNsG2wgD
         SE4XpHWM/UCCxt/z8g3SsJQXfHi9jFmlx1EycWSeWyx1DIiGgRsl9X8+S73J/BL9QcEG
         I4rnDfPFrEj2XCrkHqeki7TvBC1QR8m7MgAKHy4nz57A+DAMh/ZZ+gS8fgg5DvaCZWAp
         MzWA==
X-Forwarded-Encrypted: i=1; AJvYcCV7so6b+1mfaK3byXv6Q07WmLeR2LlfQaR5T3vEZK6erdF2fxyBTTQDn+rZO6y5VSWLXBLpWvXCJ7rUHj3V@lists.infradead.org, AJvYcCW4I0tH7H1gqjdRYcr0Qh6AuXYT/hHy8KSR3jlcFjaNbOGB9l3eAG3IbsHzhCCsNg5wpni4QMuMbKG6AnDmPPmCpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/e9g4J1KpZkSXy2Ji3wP30/fi/AIoYiRPgl2rvXLeY1GykSJl
	PuC0n+UkuUDLTkWbSpzsOcP3mdah7yF40NVG24zR7QUQWsigideqLNEX
X-Gm-Gg: ASbGnctvelmUlywP4tn/UK412YUG3tIMsGJ3IKB9p6ydtj3EfXgPFkCYMTHNjAox9Tg
	rB1R0xrNUdEtciioJBPavGVY2//HslDe1+1VF97azjrj13TFRUvF2xJ+6GQ6Cll7OjLZhKWjIn0
	02rOj8XKVLqWGJYK1nJm3PCi1pLenH4+zPcg7+EJY65VectuPcxHlGd3JK8JTnvpSSMkQhS7Pg9
	q8ZKHP33BohsqwM0iNRUlxTTuqQTgPIf08lXbeM14uQwy5/qGMZvCECpcCnPVMvNw4z23rjThcC
	7vUdvWIzaEKys61A0sBlCjf8bi/FcNB2SpfA1HXauTfyqBqD1e7IMXhF3PhtKTGVMWtDOruL9Pl
	gd/UeO7FMIi4lUZE/qbvi
X-Google-Smtp-Source: AGHT+IH0PqNjC6PoFYiYSzlQkFiRl1br9OBwRTA+P1HjLnfy+GnCt9CSGYrubD44ufk3hcYJLcLUDw==
X-Received: by 2002:a05:6a21:33a0:b0:240:1a3a:d7ed with SMTP id adf61e73a8af0-24340d59ba3mr14443254637.41.1756104768135;
        Sun, 24 Aug 2025 23:52:48 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:52:46 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 00/11] Add cache information to Amlogic SoC
Date: Mon, 25 Aug 2025 12:21:40 +0530
Message-ID: <20250825065240.22577-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235249_421728_2486EB38 
X-CRM114-Status: GOOD (  10.68  )
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

TW9zdCBwdWJsaWNseSBhdmFpbGFibGUgQW1sb2dpYyBkYXRhc2hlZXRzIG1lbnRpb24gdGhhdCB0
aGUgQ1BVIGVtcGxveXMKYSBhcmNoaXRlY3R1cmUsIHF1YWQtY29yZSBBUk0gQ29ydGV4LUE1MyBh
bmQgQVJNIENvcnRleCBBNTUgYW5kCkNvcnRleC1BNzMgYW5kIENvcnRleC1BNTMgY2x1c3Rlciwg
c2hhcmluZyBhIHVuaWZpZWQgTDIgY2FjaGUgdG8gZW5oYW5jZQpvdmVyYWxsIHN5c3RlbSBwZXJm
b3JtYW5jZS4KCkhvd2V2ZXIsIHRoZXNlIGRvY3VtZW50cyB0eXBpY2FsbHkgb21pdCBkZXRhaWxz
IHJlZ2FyZGluZyB0aGUgc2l6ZXMgb2YgdGhlCkwxIGRhdGEgY2FjaGUsIEwxIGluc3RydWN0aW9u
IGNhY2hlLCBhbmQgTDIgY2FjaGUuCgpUaGUgcGF0Y2hlcyBpbiBxdWVzdGlvbiBhbGlnbiB3aXRo
IHRoZSBjYWNoZSBzcGVjaWZpY2F0aW9ucyBwcm92aWRlZCBieQpBUk0gVFJNIGZvciB0aGUgcmVz
cGVjdGl2ZSBDUFUgY29yZXMuCgpBUk0gQ29ydGV4LUE1MwpMMTogMzJLQiBpbnN0cnVjdGlvbiAr
IDMyS0IgZGF0YSBjYWNoZQpMMjogVW5pZmllZCA1MTJLQiBjYWNoZQpMMSBjYWNoZSBkZXRhaWxz
LCBMMiBjYWNoZSBkZXRhaWxzCgpbMV0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVu
dGF0aW9uL2RkaTA1MDAvai9MZXZlbC0xLU1lbW9yeS1TeXN0ZW0vQWJvdXQtdGhlLUwxLW1lbW9y
eS1zeXN0ZW0/bGFuZz1lbgpbMl0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0
aW9uL2RkaTA1MDAvai9MZXZlbC0yLU1lbW9yeS1TeXN0ZW0vQWJvdXQtdGhlLUwyLW1lbW9yeS1z
eXN0ZW0/bGFuZz1lbgoKQVJNIENvcnRleC1BNTUKQ2FjaGUgc2l6ZXMgYXJlIGltcGxlbWVudGF0
aW9uLWRlcGVuZGVudDsgcmVmZXIgdG8gQVJNIGRvY3VtZW50YXRpb24gZm9yIGNvbmZpZ3VyYXRp
b24gb3B0aW9ucy4KClszXSBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24v
MTAwNDQyLzAyMDAvRnVuY3Rpb25hbC1kZXNjcmlwdGlvbi9JbnRyb2R1Y3Rpb24tdG8tdGhlLUNv
cnRleC1BNTUtY29yZS9JbXBsZW1lbnRhdGlvbi1vcHRpb25zCgpBUk0gQ29ydGV4LUE3MyAoYXMg
dXNlZCBpbiBBbWxvZ2ljIFM5MjJYIGFuZCBUNykKTDE6IENvbmZpZ3VyYWJsZSwgdHlwaWNhbGx5
IDY0S0IgaW5zdHJ1Y3Rpb24gKyA2NEtCIGRhdGEKTDI6IFVuaWZpZWQgY2FjaGUsIGNvbmZpZ3Vy
YWJsZSB1cCB0byAxTUIgb3IgbW9yZQpMMiBjYWNoZSBkZXRhaWxzLAo0w5cgQ29ydGV4LUE3MyBj
b3JlcyAodXAgdG8gMS44R0h6KSB3aXRoIDFNQiBzaGFyZWQgTDIgY2FjaGUKMsOXIENvcnRleC1B
NTMgY29yZXMgd2l0aCAyNTZLQiBzaGFyZWQgTDIgY2FjaGUKCls0XSBodHRwczovL2RldmVsb3Bl
ci5hcm0uY29tL2RvY3VtZW50YXRpb24vMTAwMDQ4LzAxMDAvbGV2ZWwtMS1tZW1vcnktc3lzdGVt
L2Fib3V0LXRoZS1sMS1tZW1vcnktc3lzdGVtP2xhbmc9ZW5MMgpbNV0gaHR0cHM6Ly9kZXZlbG9w
ZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uLzEwMDA0OC8wMTAwL2xldmVsLTItbWVtb3J5LXN5c3Rl
bS9hYm91dC10aGUtbDItbWVtb3J5LXN5c3RlbT9sYW5nPWVuCls2XSBodHRwczovL2FuZHJvaWRw
Y3R2LmNvbS9jb21wYXJhdGl2ZS1hbWxvZ2ljLXM5MjJ4LwoKQ2hhbmdlczoKdjI6IE1vZGlmaWVk
IHRoZSBjb21taXQgbWVzc2FnZSBhbmQgYWRkZWQgY2FjaGUgaW5mb3JtYXRpb24gZmV3IG1vcmUg
U29DLgoKdjE6IGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtYXJt
LWtlcm5lbC8yMDI0LUZlYnJ1YXJ5LzkwMTQ5Ny5odG1sCgpUaGFua3MKLUFuYW5kCgpBbmFuZCBN
b29uICgxMSk6CiAgYXJtNjQ6IGR0czogYW1sb2dpYzogQWRkIGNhY2hlIGluZm9ybWF0aW9uIHRv
IHRoZSBBbWxvZ2ljIEdYQkIgYW5kIEdYTAogICAgU29DCiAgYXJtNjQ6IGR0czogYW1sb2dpYzog
QWRkIGNhY2hlIGluZm9ybWF0aW9uIHRvIHRoZSBBbWxvZ2ljIFNNMSBTb0MKICBhcm02NDogZHRz
OiBhbWxvZ2ljOiBBZGQgY2FjaGUgaW5mb3JtYXRpb24gdG8gdGhlIEFtbG9naWMgRzEyQSBTb0NT
CiAgYXJtNjQ6IGR0czogYW1sb2dpYzogQWRkIGNhY2hlIGluZm9ybWF0aW9uIHRvIHRoZSBBbWxv
Z2ljIEFYRyBTb0NTCiAgYXJtNjQ6IGR0czogYW1sb2dpYzogQWRkIGNhY2hlIGluZm9ybWF0aW9u
IHRvIHRoZSBBbWxvZ2ljIEdYTSBTb0NTCiAgYXJtNjQ6IGR0czogYW1sb2dpYzogQWRkIGNhY2hl
IGluZm9ybWF0aW9uIHRvIHRoZSBBbWxvZ2ljIEExIFNvQwogIGFybTY0OiBkdHM6IGFtbG9naWM6
IEFkZCBjYWNoZSBpbmZvcm1hdGlvbiB0byB0aGUgQW1sb2dpYyBBNCBTb0MKICBhcm02NDogZHRz
OiBhbWxvZ2ljOiBBZGQgY2FjaGUgaW5mb3JtYXRpb24gdG8gdGhlIEFtbG9naWMgQzMgU29DCiAg
YXJtNjQ6IGR0czogYW1sb2dpYzogQWRkIGNhY2hlIGluZm9ybWF0aW9uIHRvIHRoZSBBbWxvZ2lj
IFM3IFNvQwogIGFybTY0OiBkdHM6IGFtbG9naWM6IEFkZCBjYWNoZSBpbmZvcm1hdGlvbiB0byB0
aGUgQW1sb2dpYyBTOTIyWCBTb0MKICBhcm02NDogZHRzOiBhbWxvZ2ljOiBBZGQgY2FjaGUgaW5m
b3JtYXRpb24gdG8gdGhlIEFtbG9naWMgVDcgU29DCgogYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtYTQuZHRzaSB8IDM3ICsrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvYW1sb2dpYy1jMy5kdHNpIHwgMjMgKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL2FtbG9naWMtczcuZHRzaSB8IDM2ICsrKysrKysrKysKIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kgfCA3NCArKysrKysrKysrKysrKysrKysrKysK
IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpICAgfCAxNSArKysrKwog
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5kdHNpICB8IDIxICsrKysrKwog
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEuZHRzaSB8IDI3ICsrKysrKysr
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi5kdHNpIHwgNjIgKysrKysr
KysrKysrKysrLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpICAg
fCAyNyArKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS5kdHNp
ICB8IDI0ICsrKysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRz
aSAgfCAyNyArKysrKysrKwogMTEgZmlsZXMgY2hhbmdlZCwgMzY2IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDFiMjM3ZjE5MGViM2QzNmY1MmRmZmUwN2E0MGI1
ZWIyMTAyODBlMDAKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
