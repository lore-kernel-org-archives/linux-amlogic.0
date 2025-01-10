Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D6BE7719D
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2025 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wgPQGjav9D+O7RdWX4BSnK6C/T65aQEwVyZk0VqCkN0=; b=h0Ls8DS1/xUfYg
	LMZtiY2Ik2zZm3tURn8AOAw6Mddv3Y8L8AsujrrpED1vSFngPa5WwmOIreFngB2aue+GXePE6jPGu
	GVIzwR52dVP6oOr5WH0xFb2xQmcfiMpiRIIAZOv9IvaM1JXwGikFBSGOjkMuuw8ECYBDf06wza2Ln
	6l6zejf6pjjTYKWYULp1GRqnOcJi2dIuPSkwOgru7eqLiqIFzhsWNt+Z1c8cVnzTd6z+ibiCBYRhr
	R0dXnqcUhSy1R889C/GNqeFc+ApYA/CoeHjXmhhW13fj9nkbtG7Cd8olEsLTqpuaofVP62tqlGpOR
	kDD+HNSCBZ1cJHC8nYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLCj-0000000GqMT-1jbV;
	Fri, 10 Jan 2025 20:02:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLCh-0000000GqLa-0zKG
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jan 2025 20:02:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso3366939a91.1
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jan 2025 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bizdrive.in.net; s=google; t=1736539317; x=1737144117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ze7kgvi8pmS4xQq554trq1SSrfy1YRgiq8NEGv01ew=;
        b=NBsbqoZNfhknahX8tohSTH2IPc8lspqNt5g5c4k6/aLJRsOze8N65iMphy3wSpos0U
         G8NoFaW8k2LY/6pb5S/ZUq+JYKNsBrGXpmDGhQHN9TgPCKjepvlmccQv1QAVRpCbgZ3N
         QpSUz1Ql3WSmaLvSAaTRCqrWA3oZxP80L9jN0q1ef/oFJsdLtL2LKFdBJHpapoOG+9w5
         az+ICysRUAWay508GhCN1FKZkXb8AEmqWNZmVotFVUPJdCgsroTt5uQt4rvDr8iFnYxP
         NlvMxtg15zFO8puwLv6mZ1OaVfn6VDD5rIi/D7rUa/cwX6lKTcUD8kHF1HrA7hKhmkRk
         M9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736539317; x=1737144117;
        h=content-transfer-encoding:mime-version:date:subject:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ze7kgvi8pmS4xQq554trq1SSrfy1YRgiq8NEGv01ew=;
        b=xGZwRDi/4zlc3Qy5Fgsjv7r3dxbZQrB03wJ43nz4JKUy5XSSAHGYeBU9AwhbSsy1hZ
         q0ZatptLTib1wTcjrdu8mT0q5DzLsqRXHkLlxc2NI06IKq+oBb45qEi5faNT72Fu+Zw+
         /A5b3xtvCvMKlFlSRaOvgjjtMtKKIGOy1bfzl/F1F2tHGNZNG8xoUY3iz5x475Rb365I
         bVMh65Udn263ts7/os6rEG65hVutVrri9gosDv15b80gyMX5iWoYfdOD8JT7P3PeYLRL
         Xz7wXJ7FkkwaiVFSqQvwxF5uHT4wf9cf8lXTa6QV6M3yPwvn10t3n9tePCAPf8wJxWC1
         4aXw==
X-Gm-Message-State: AOJu0YyWEvwZzGGILTzm4Wxm8d+Kjmqrtt4mTwr7/GEvJWw5Cg2qOUBY
	0S7bzDAKTMhU1G899jIHwaAZ1VmUr5k6tK03HSo/0GgDIXMczFVrdLPi11Ji6M1hhu2sMmnhsSw
	R
X-Gm-Gg: ASbGncsee8+XmWTncbDwG8Djwwb5djCU/j9ZFtHdtqanOGkMsXVWPX7EYp22DDq3XeG
	yU61mQsXmRCQ8WpPYbnhUzTrQvyyNq1dmsSUZJnvHsaF5RA6ScSFBrG+Gxqgo9zQQ+03IfL5qSH
	yrAMLx8LqeNAJXNgycvVVUOrcaPoCsplwEK/SUoeamMt2BlzctFHYh6d6zTvU+xSYRfAdaeLHvz
	bQG1AmPSqcMK/aNFSqUUwm6nI/erXBjSHWY6sgqLraFA5OA6qwcpKKCCDG1Zu8XaAk91+ZuW4YA
	hmKkc7z0jJjeDG8REcPEbf5Qcw0=
X-Google-Smtp-Source: AGHT+IGML4KGTP0FODqkYQTpYK+jJ5xSUkBb8XtSL0q8jtYe2cR/IgNRbqRtMVAuLdy5WIThxWwd+g==
X-Received: by 2002:a17:90b:258b:b0:2ee:c2df:5d30 with SMTP id 98e67ed59e1d1-2f548f1a2b8mr15130565a91.26.1736539317294;
        Fri, 10 Jan 2025 12:01:57 -0800 (PST)
Received: from mlhytinh.cn (c-73-170-41-125.hsd1.ca.comcast.net. [73.170.41.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593d0911sm3928755a91.8.2025.01.10.12.01.55
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jan 2025 12:01:56 -0800 (PST)
Message-ID: <85a33b5985c256fda30ef4772659c6a4@bizdrive.in.net>
From: =?utf-8?Q?=EF=BC=AA=EF=BC=A1=E3=83=8D=E3=83=83=E3=83=88=E3=83=90=E3=83=B3=E3=82=AF?= <sendonly992@bizdrive.in.net>
To: "=?utf-8?Q?linux-amlogic@lists.infradead.org?=" <linux-amlogic@lists.infradead.org>
Subject: =?utf-8?Q?=E3=80=90=E7=B7=8A=E6=80=A5=E6=83=85=E5=A0=B1?=
	=?utf-8?Q?=E3=80=91=E7=99=BB=E9=8C=B2=E5=80=8B=E4=BA=BA=E6=83=85?=
	=?utf-8?Q?=E5=A0=B1=E5=86=8D=E7=A2=BA=E8=AA=8D=E3=81=AE=E3=81=8A?=
	=?utf-8?Q?=E9=A1=98=E3=81=84?=
Date: Fri, 10 Jan 2025 20:01:54 +0000
X-Priority: 3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_120159_277233_73FDA8F0 
X-CRM114-Status: UNSURE (   1.58  )
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

44GE44Gk44KC77yq77yh44ON44OD44OI44OQ44Oz44Kv44KS44GU5Yip55So44GE44Gf44Gg44GN
44GC44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCDQoNCuePvuWcqOOAgeW9k+ihjOOBq+OB
p+OBr+mHkeiejeW6geaMh+WwjuOBruOCguOBqOOAgeODnuODjeODreODs+etieWvvuetluOBruS4
gOeSsOOBqOOBl+OBpuOAgeOBiuWPluW8leOBruWGheWuueOAgeeKtuazgeetieOBq+W/nOOBmOOB
puOAgemBjuWOu+OBq+eiuuiqjeOBl+OBn+awj+WQjeODu+S9j+aJgOODu+eUn+W5tOaciOaXpeOD
u+OBlOiBt+alreOChOOAgeWPluW8leOBruebrueahOetieOBq+OBpOOBhOOBpuOAgeWGjeW6puei
uuiqjeOCkuOBleOBm+OBpuOBhOOBn+OBoOOBhOOBpuOBiuOCiuOBvuOBmeOAgg0KDQrjgYrmiYvm
lbDjgYrjgYvjgZHjgZfjgb7jgZnjgYzjgIHkuIvoqJjjga7jg6rjg7Pjgq/jgpLjgqLjgq/jgrvj
grnjgZfjgIHmj5Dlh7rjgavjgZTljZTlipvjgY/jgaDjgZXjgYTjgIINCg0KaHR0cHM6Ly9mcmFu
c3RhZ2UuY29tL3lhYml0aGEuaHRtbA0KDQoNCuOBlOeiuuiqjeOCkuOBhOOBn+OBoOOBkeOBquOB
hOWgtOWQiOOAgeOCu+OCreODpeODquODhuOCo+S4iuOBruims+eCueOBi+OCieOBlOWIqeeUqOWI
tumZkOOCkuOBi+OBkeOBleOBm+OBpuOBhOOBn+OBoOOBj+OBk+OBqOOCkuS6iOOCgeOBlOS6huaJ
v+S4i+OBleOBhOOAgg0KDQrjgYrlrqLmp5jjgavjga/jgZTov7fmg5HjgIHjgZTlv4PphY3jgpLj
gYrmjpvjgZHjgZfjgIHoqqDjgavnlLPjgZfoqLPjgZTjgZbjgYTjgb7jgZvjgpMNCu+8je+8je+8
je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8je+8
je+8je+8je+8je+8je+8je+8jQ0KDQrjgZTkuI3mmI7jgarngrnjgYzjgZTjgZbjgYTjgb7jgZfj
gZ/jgonjgIHkuIvoqJjjgb7jgafjgZTpgKPntaHjgY/jgaDjgZXjgYTjgIINCumAo+e1oeWFiCDv
vJDvvJHvvJLvvJDvvI3vvJDvvJXvvJjvvI3vvJDvvJnvvJgNCuOBk+OCjOOBi+OCieOCgu+8qu+8
oeODjeODg+ODiOODkOODs+OCr+OCkuOCiOOCjeOBl+OBj+OBiumhmOOBhOOBl+OBvuOBmeOAggoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
